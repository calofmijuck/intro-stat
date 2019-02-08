##Lecture04


### normal distribution

## normal distribution의 확률밀도함수 값

dnorm(0,mean = 0, sd= 1)

# 주의할점은 보통 N(mu, variance)로 분포를 표시하는 것과 달리, 표준편차인 standard deviance를 기입
# 또한 강의노트에는 Pr(X=x)로 표기되어있지만 연속형 확률분포는 Pr(X=x)=0이므로
# density function인 f(x)의 값을 구해주는 것으로 보는 것이 맞다.

x <- c(-1,0,1)
dnorm(x,0,1) #x 값에 벡터를 입력하며 각 벡터의 성분에 대응되는 확률밀도함수 값을 얻을 수 있다.





## 확률 밀도함수를 그려보자

#약간의 근사를 필요로함
x <- seq(from = -3 , to = 3 , by=0.1) #  -3부터 +3의 구간에서 간격이 0.1인 벡터를 생성
fx <- dnorm(x,0,1)
plot(x,fx,type = "l",main = "표준정규분 확률밀도함수") # type = "l" 은 선으로 그래프를 이음을 의미



## 누적분포함수
pnorm(0, mean=0, sd=1) # N(0,1)의 분포에서 Pr(X < 0)을 구하는 코드

#가령 전구의 수명이 평균 2000시간, 표준편차 200시간인 정규분포라면 X ~ N(2000,500^2)이므로
#수명이 2500시간 이하일 확률은
pnorm(2500, mean=2000, sd=200)

#만약 1800시간 이상일 확률은 어떻게 구할까?
1-pnorm(1800, 2000, 200)

pnorm(1800,2000,200,lower.tail = F)


## 정규분포의 분위수 계산

#이번은 X~N(mu,sigma) 일 때, P(X<x)=p 인 p분위수 x를 구하는 코드이다.
qnorm(p, mean = mu, sd = sigma)
#안돌아가므로 p와 mu, sigma에 해당하는 값을 지정해주면 됩니다.

# IQ테스트 점수가 평균이 100이고 표준편차 15인 정규분포라면 
# 상위 2퍼센트의 멘사에 가입하기 위해서 몇점이상의 점수를 얻어야할까?

p <- 0.98 #상위 2%이므로 98% 분위수를 써야합니
mu <- 100
sigma <- 15
qnorm(p, mean = mu, sd = sigma)

#또는 lower.tail=F 를 이용
q <- 0.02
qnorm(q, mean = mu, sd = sigma , lower.tail = F)
면



### Binomial distribution(이항분포)

## binomial의 density function

dbinom(x, size = n, prob = p) # X~ B(n,p)일 때, P(X=x)의 값을 구함

x <- 3
n <- 3
p <- 0.5
dbinom(x, size = n, prob = p) # 0.5^3 임을 알수있다.

## 이항분포의 확률밀도함수 그리기

x<-0:6
fx<-dbinom(x, 6, 0.5)
plot(x, fx, main="이항분포의 확률밀도함수", type="h") # type="h"는 막대형태의 히스토그램으로 표현하는 방법

#normal과 마찬가지지만 이번에는 X가 음이아닌 정수만을 취하므로 0:6을 도메인으로 잡는다


## 이항분포의 누적분포함수

pbinom(x,size = n,prob = p) # X~ B(n,p)일 때, P(X<=x)의 값을 구함




# 어느 생산 공정의 불량률은 10%이다. 이 공정에서 임의로 5개를 추출할 때, 불량품이 3개일 확률은
x <- 3
n <- 5
p <- 0.1 
dbinom(x,size = n,prob = p)

# 만약 같은 공정에서 20개의 샘플을 추출할 떄, 5개 이하일 확률은?
x <- 5
n <- 20
p <- 0.1
pbinom(x,size = n,prob = p)


## 이항분포의 정규근사

p<-0.1 #이항분포의 확률을 0.1로 세팅
n<-c(10,30,50) # n은 10인경우, 30인 경우, 50인 경우르 동시에 확인
par(mfrow=c(1,3)) #그래프를 1*3의 공간에 그리기위한 코드
for (i in 1:3){
  x<-seq(from=0, to=n[i], by=1) #이항 분포의 그래프를 그리는 부분
  fx<-dbinom(x, n[i], p)
  plot(x, fx, pch=16, xlim=c(-3,15), ylab="probability",xlab="", main=paste("이항분포의 정규근사(p=",p,", n=",n[i],")"))
  lines(x, fx) # (x,y)를 기존의 그래프는 상점도이지만 이 코드를 넣으면 각 점을 이은 선그래프를 그리
  
  y<-seq(from=-5, to=15, by=0.1) #근사된 정규분포의 그래프를 그리는 부분
  mu<-n[i]*p #정규근사시 np로 근사된다.
  sd<-sqrt(n[i]*p*(1-p)) #정규근사시 분산이 npq로 근사된다. 따라서 sd는 그의 제곱ㄱ
  fy<-dnorm(y, mu, sd)
  lines(y, fy, col="red")
} 

# 이항분포 plot에 type = "l"을 넣어도 되지만 그경우 점이 찍히지 않아 어느 점들을 이은 것인지 구분이 용이하지 않음



## 중심극한정리

# x_i들이 iid일 때,  x_bar ~ N(mu, sigma^2/n)을 따름을 알고있다.

#균등분포 U(0,1)에서 10개의 표본을 추출하여 표본평균 X_bar를 구하는 실험을 200회 반복하면
dev.off()
n<-10 # 1회 시행에서 추출할 표본의 개수
x.mean<-c() # 각 시행에서 추출된 표본의 평균을 저장할 벡터로써 빈벡터를 생ㅅ
for (j in 1:200){ # 총 200번의 반복시행을 위한 반복문
  x <- runif(n, min=0, max=1) # random uniform을 의미, runif(n, min=a, max=b) 균등분포 U(a,b) 에서 n개만큼의 표본을 생성
  x.mean[j]<-mean(x) 
  } # 위에 만들어놓은 x.mean의 j번째 성분(현재 비어있음)에 길이 n짜리 벡터들의 표본평균 값을 입력

hist(x.mean, xlim=c(0,1), probability=T, main=paste("표본평균의 분포 n=",n)) #주어진 x.mean 200개의 sample을 그려보자

#만약 10개가 아닌 30개, 50개, 100개로 증가시킨다면 
n<-c(10,30,50,100)
par(mfrow=c(1,4)) # 다중 그래프창 생성
for (i in 1:4){ # 총 4번의 서로 다른 표본의 개수로 실험 각각 10개, 30개, 50개 100개 네번의 실험설계
  x.mean<-c()
  for (j in 1:1000){ # 각 표본의 크기별로 1000번씩 반복
    x<-runif(n[i], 0, 1) # n[i]는 n의 i번째성분이고 i -for문에서 순서대로 10,30,50,100을 가지게도
    x.mean[j]<-mean(x) } # n[i]개로 만든 x_bar를 1000개 생성
  hist(x.mean, xlim=c(0,1), probability=T, main=paste("표본평균의 분포 n=",n[i]))
  
  y<-seq(0, 1, 0.01)
  mu<-0.5 # (0,1) 균등분포의 모평균
  sigma<-sqrt(1/12) # (0,1) 균등분포의 모표준편차
  fy<-dnorm(y, mu, sigma/sqrt(n[i]))
  lines(y, fy) 
} #표본평균이 근사적으로 따르는 정규 분포

### 여러가지 분포

## 카이제곱분포

#카이제곱의 대의적정의 표준정규분포의 제곱sum임을 이용하여 그린 경우 chi(n)을 그린다.
n=1
xsquare.sum=c()
for (i in 1:1000) {
  x<-rnorm(n, 0,1)
  xsquare.sum[i]<-sum(x*x)
}
hist(xsquare.sum, probability=T, main=paste("카이제곱 분포, 자유도=",n))

# 이경우 내장함수인 카이제곱의 확률밀도함ㅅ
y<-seq(0, 15, 0.1)
fy<-dchisq(y,n)
lines(y, fy) 

#자유도를 1,5,10으로 변화시켜 확인하려면 위의 코드에 n은벡터로 for문안에서는 n[i]를 돌리자
par(mfrow=c(1,3))
n <- c(1,5,10)
for (j in 1:3) {
  xsquare.sum=c()
  for (i in 1:1000) {
    x<-rnorm(n[j], 0,1)
    xsquare.sum[i]<-sum(x*x)
  }
  hist(xsquare.sum, probability=T, main=paste("카이제곱 분포, 자유도=",n[j]))
  y<-seq(0, 15, 0.1)
  fy<-dchisq(y,n[j])
  lines(y, fy) 
  
}


### 정분분포 분위수 대조도

## 정규모집단 가정이 올바른지 확인하는 과정


download.file("http://www.openintro.org/stat/data/bdims.RData", destfile = "bdims.RData")
load("bdims.RData")
bdims

write.table(bdims, file = "C:/Users/이성찬/Desktop/2018 SNU/Fall 2018/통계학실험/bdims.txt", sep=", ") #데이터 내보내기
bdims <- read.csv( "C:/Users/이성찬/Desktop/2018 SNU/Fall 2018/통계학실험/bdims.txt" , header = T) #데이터 불러오기
bdims <- as.data.frame(bdims)
bdims.m <- bdims[bdims$sex==1,]
bdims.f <- bdims[bdims$sex==0,]

par(mfrow=c(1,2))
hist(bdims.f$bii.di)
qqnorm(bdims.f$bii.di)
qqline(bdims.f$bii.di, col=2) #col은 색깔




