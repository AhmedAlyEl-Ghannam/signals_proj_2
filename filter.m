[song, Fs] = audioread('nevergonnagiveyouup.mp3');
%sound(song, Fs)
%no of samples = length(song)%
Ns = length(song);
%no of samples / Hz = length(song) / Fs%
s_per_hz = ceil(Ns / Fs);
song_f = abs((fftshift(fft(song))));
f = linspace(-Fs/2, Fs/2, Ns);
figure
plot(f, song_f)
%band pass filter -3.4kHz --> 3.4kHz%
f_filter = 3400;
lim1 = ((Fs/2) - f_filter) * s_per_hz;
lim2 = Ns - lim1 + 1;
song_f([1:lim1 lim2:Ns], :) = 0;
figure
plot(f, song_f)
song_filtered = real(ifft(song_f));
%sound(song, 2*f_filter)


