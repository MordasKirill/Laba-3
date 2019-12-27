clc;
clear all;
close all;
N = 1500; %число 
a = 1; 
b = 4;
a0 = rand(1, N); %генерация непрерывной случайной величины
beta = 0.95;
y_beta = 1.96; %корень уравнения
%Fx = sqrt(x) - sqrt(a);
x = F_1(a, a0); % векторо значений ф-ции, обратной ф-ции распределения
mean_theory = (b^(3/2) - a^(3/2)) / 3; %теоретическое мат. ожидание
mean_pr = mean(x); %практическое мат. ожидание
mean_ocenka = sum(x) / N; %оценка мат. ожидания
disp(['Max value: ' num2str(b)]);
disp(['Min value: ' num2str(a)]);
disp(['Mean: theory = ' num2str(mean_theory) '; estimation = ' num2str(mean_ocenka) ';']);
disp(['Mean: practical = ' num2str(mean_pr)]);
%дисперсия
f1 = @(x_1) ((x_1 - mean_theory).^2) ./ (2 * sqrt(x_1));  
dispersion_theory = integral(f1, a, b);
dispersion_ocenka = sum(x.^2)/(N-1) - ((sum(x)).^2)/(N * (N-1));
disp(['Dispersion: theory = ' num2str(dispersion_theory) ';' 'ocenkaDisp = ' num2str(dispersion_ocenka) ';' ]);
dispersion_var = var(x);
disp(['Dispersion: varcenka = ' num2str(dispersion_var)]); 
%среднеквадратичное отклонение
sigma = sqrt(dispersion_theory);
disp(['St. dev. disc. : estimation = ' num2str(sigma) ';']);
%определение доверительного интервала
dovIntMin = mean_ocenka - (y_beta * sigma) / sqrt(N); %минимум 
dovIntMax = mean_ocenka + (y_beta * sigma) / sqrt(N); %максимум
disp(['Doveritelny interval: min = ' num2str(dovIntMin) ';' ' max = ' num2str(dovIntMax) ';']);
%графики эмпирической плот-ности распределения случайной величины и (теоретической) плот-ности распределения
figure(1);
dx = (b - a) / 100;
centry = a + dx / 2: dx : b - dx / 2;
popad = hist(x, centry) ./ (N * dx);
hold on;
plot(centry, popad);
xlabel('Значения случайной величины');
ylabel('Значечие имперической пл-ти вер-ти');
var = a:0.01:b;
plot(var, (1 ./ (2 * sqrt(var))), 'r');
hold off;





















