function out = tone_vocoder(sig, n_bands, ctof_fq, but_order, fs)
    if(size(sig,2)==1) 
        sig = sig';
    end

    fbe = 200;
    fen = 7000;

    f2d = @(f) log10(f/165.4 + 1) / 0.06;
    % 求耳蜗长度
    d2f = @(d) 165.4 * (10.^(0.06*d) - 1);
    % 求对应长度所对应的频率

    out = zeros(1,length(sig));

    dbe = f2d(fbe); 
    % 耳蜗长度最小值
    den = f2d(fen);
    % 耳蜗长度最大值
    ds = linspace(dbe, den, n_bands+1);
    % 用n+1个数产生n个间隔，产生耳蜗长度的等间距分布
    [lpf_b, lpf_a] = butter(but_order, ctof_fq/(fs/2));
    % cotf_fq是产生包络的截止频率
    t = (0:length(sig)-1)/fs;
    for i = 1:n_bands
        d0 = ds(i); d1 = ds(i+1); 
        % 该滤波器所对应的耳蜗长度
        f0 = d2f(d0); f1 = d2f(d1);
        % 该耳蜗长度对应的频率分布
        fmid = (f0+f1)/2;
        [bpf_b, bpf_a] = butter(but_order, [f0 f1]/(fs/2));
        road = abs(filter(bpf_b, bpf_a, sig));
        % 通过带通滤波器把某一频率片段的信号筛选出来
        road_lpf = filter(lpf_b, lpf_a, road);
        % 通过一个低通滤波器产生包络
        carry = sin(2*pi*fmid*t);
        % 用带通滤波器的中频模拟频率
        out = out + carry.*road_lpf;
    end
    out = out/norm(out)*norm(sig);
end