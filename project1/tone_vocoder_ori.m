function out = tone_vocoder(sig, n_bands, ctof_fq, but_order, fs, fbe, fen)
    if(size(sig,2)==1) 
        sig = sig';
    end
    f2d = @(f) log10(f/165.4 + 1) / 0.06;
    d2f = @(d) 165.4 * (10.^(0.06*d) - 1);

    out = zeros(1,length(sig));

    dbe = f2d(fbe); den = f2d(fen);
    ds = linspace(dbe, den, n_bands+1);
    [lpf_b, lpf_a] = butter(but_order, ctof_fq/(fs/2));
    t = (0:length(sig)-1)/fs;
    for i = 1:n_bands
        d0 = ds(i); d1 = ds(i+1); 
        f0 = d2f(d0); f1 = d2f(d1);
        fmid = (f0+f1)/2;
        [bpf_b, bpf_a] = butter(but_order, [f0 f1]/(fs/2));
        road = abs(filter(bpf_b, bpf_a, sig));
        road_lpf = filter(lpf_b, lpf_a, road);
        carry = sin(2*pi*fmid*t);
        out = out + carry.*road_lpf;
    end

    out = out/norm(out)*norm(sig);
end