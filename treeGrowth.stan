//Part 1 data block
//Temp, a predictor, indicate observed temperature difference
//height, a response, indicate observed mean tree height
data {
  int<lower=0> N;
  vector[N] Temp;
  vector[N] height;
}

//Part 2 parameters block
//theta=(alpha, beta1, beta2, sigma)
//alpha: unknown intercept, baseline height when MAT difference=0
//beta1: unknown linear coefficient
//beta2: unknown quadratic coefficient
//sigma: SD, how much heights vary around their expected values
parameters {
  real alpha;
  real beta1;
  real beta2;
  real<lower=0> sigma;
}

//Part 3 model block
model {
  //set the equation used for calculating the expected log (height)
  mu = alpha + beta1*Temp + beta2 * Temp^2
  //Set prior distributions (privious understanding about each parameter)
  alpha ~ normal(5,3);
  beta1 ~ normal(1,0.5);
  beta2 ~ normal(0,0.5);
  sigma ~ exponential (1);
  
  //Is vector[N] mu used to define mu?
  vector [N] mu = alpha + alpha + beta1*Temp + beta2 * Temp^2 

//Likelihood
  log(height) ~ normal(mu,sigma);
}

