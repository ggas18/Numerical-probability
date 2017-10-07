function [I_hat,flag,err_std,n]=monteCarlo(alpha,delta,N,g,f)
  % Cette fonction fait une simulation de Monte Carlo avec un niveau de
  % confiance alpha et une erreur absolue delta donnée également.
  % ENTREE : alpha: Niveau de confiance
  %          delta: Erreur absolue
  %          N: Le nombre maximum de simulation
  %          g: Fonction dont on veut calculer l'intégrale
  %          f: Densité de X
  % SORTIE : I_hat: La valeur approchée de la quantité que nous voulons
  %                 évaluer.
  X= pi*rand();
  S1=X; % somme partielle des Yi
  S2=X^2; % somme patielle des carrées des Yi
  s=inf;% on intialise la variance avec l'infinie
  Z=norminv((alpha+1)/2,0,1); % le quantile d'ordre (alpha+1)/2 de la loi
  % normale
  
  
  n=2;
  % On fait un nombre n de simulation et on teste si la precision souhaitée
  % est atteinte.
 while(n<=N && ((s/sqrt(n))*Z)>delta)

      X=pi*rand();% on simule une variable aléatoire uniforme sur [0,pi]
      Y=g(X)/f(X);% on évalue ensuite Y 
      S1=S1+Y;
      S2=S2+Y^2;
      s=(S2-(S1/n)^2)/(n-1);
      n=n+1;
  end
 flag=0;
 if(((s/sqrt(n))*Z)<=delta)
     flag=1;
 end
 % on retourne l'estimation obtenue.
 I_hat=S1/n;
 err_std=s/sqrt(n);
end