function [ X ] = uniformGen(n)
% Cette fonction simule une loi uniforme sur
% {0,1, ..., n-1} en utilisant la methode
% general pour simuler les v.a discrètes.
U=rand(); % on simule une loi uniforme sur [0,1]
k=0; % l'indice va parcourir les cumuls des probas
% pour retrouver l'intervalle dans lequel nous 
% sommes situés.

% tant qu'on n'est pas dans l'intervalle en question
% on augmente l'indice
while not(U<= (k+1)/n && U> k/n)
    k=k+1; % 
end

X=k;
end

