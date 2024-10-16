lambda <- 1
n_value<- 1000
a_value <- c(0.5, 1, 2, 5)

#target density
fx<-function(x){
if(x>=a){
return(lambda*exp(-lambda*(x-a)))
}else{
return(0)
}
}

#proposal density
gy<-function(y){
return(lambda*exp(-lambda*y))
}

M<-exp(lambda*a)

rejection_sampling<-function(lambda,a,n_value){
accepted<-0
trials<-0

while(length(accepted)<n_value){
trials<-trials+1
#Draw sample from Y ~ Exp(lambda)
y<-rexp(1,rate=lambda)
x<-y+a

#Accept or Reject
u<-runif(1)
if(u<exp(-lambda*a)){
accepted<-c(accepted,x)
}
}

acceptance_rate<-n_value/trials

return(list(accepted=accepted, acceptance_rate= acceptance_rate))

}

for(a in a_value){
result<-rejection_sampling(lambda,a,n_value)
cat('a=',a,"Acceptance Rate=", result$acceptance_rate,'\n')
}
