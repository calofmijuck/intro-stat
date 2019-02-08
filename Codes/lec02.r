gender <- factor(c("M","M","M","M","M","M","M","M",
                   "F","F","F","F","F","F","F","F","F","F")) ## gender vector 입력
score <- c(98,90,96,54,43,87,88,90,
           94,92,81,79,85,91,79,88,89,83) ##score vector 입력
 
##data frame으로 만들어야 하는 이유 -> matrix로 만들면 score vector가 스칼라, gender vector가 문자열이라
##score vector를 문자열로 인식하기 때문
##gender 변수는 M과 F를 두가지 값을 갖는 범주형 자료가된다.


## Histogram

hist(score) #histogram을 그려주는 함수

par(mfrow=c(2,2)) #우측아래 plot 창에 여러개의 그래프를 그릴 수 있는 함수 c(2,2)는 2by2, 즉 4칸을 표시
hist(score) #기본값으로 설정되있는 대조그래프
hist(score, freq=F) ##기본값으로 freq는 T로 되어있습니다. ##freq 가아닌 상대도수로 표현해주는 변수
hist(score, breaks=10) #야 이거 왜 10인데 5단위로 잘리냐 모르겠다

## Stem Plot

stem(score)

## boxplot

par(mfrow=c(1,1)) 
boxplot(score)

## 분할표 - 범주형 자료의 요약

table(gender)

## fivenum, summary
fivenum(score) # min, Q1, Q2, Q3, max 값을 내놓는 함수
summary(score) # five number에 더하여 평까지 구해주는 함수

## 다양한 요약통계량 함수


sd(score) # standard deviance
sd(score)^2 #variance가 됨을 확
var(score) # variance
median(score) # median
quantile(score) #quantile
sum(score) # summation
min(score) ; max(score) #최소값 최대값
mean(score)


#이변량 자료의 요약
math <- c(66,64,48,46,78,60,90,50,66,70)
phy <- c(70,68,46,48,84,64,92,52,68,72)


# 순서대로 학생번호순서대로의 성적이라고하면 산점도를 그려 두 변수의 관계를 살필수있다.
plot(math,phy)
#plot의 입력변수들
plot(x=math,y=phy,main = "scatter plot") #문자로 넣어야합니다.
plot(x=math,y=phy,main = scatter plot) #아닐시 에러발생.
plot(x=math,y=phy,main = "scatter plot", xlim=c(60,80), ylim=c(60,70)) #좌표축의 범위 지정
plot(x=math,y=phy,main = "scatter plot", xlab="math score" , ylab = "phys score") #기본 벡터이름과는 다른 축제목 지정


dev.off()#4칸에 띄우기 위해 모든 plot을 지우는 함수
par(mfrow=c(2,2)) 

plot(math,phy, type = "p") #포인트로 관측치 표시
plot(math,phy, type = "l") #선으로 이어서 관측치 표시
plot(math,phy, type = "c") #점선으로 이어서 관측치 표시
plot(math,phy, type = "n") #관측치를 나타내지 않

dev.off()#4칸에 띄우기 위해 모든 plot을 지우는 함수


#plot을 그려 직선형태를 확인하였다면 두 변수의 상관관계를 위해 상관관계를 계산가능
cor(math,phy)





##data 실습

read.table("C:\Users\이성찬\Desktop\2018 SNU\Fall 2018\통계학실험/통계학실험/cdc.txt",header = T) #header는 주어진 테이블의 첫줄이 관측치가 아닌 변수명으로 받아들이기 위한 옵션
#결로지정시 \를 전부 / 으로 바꿔줍니다. 또는 \\으로 추가해도가능 경로보는법, 데이터파일의 속성에서 확인가능
read.table("C:\\Users\\AIzebra\\Downloads\\Rstudio_dataset\\dataset\\ch02\\cdc.txt",header = T)

cdc <- read.table("C:\\Users\\AIzebra\\Downloads\\Rstudio_dataset\\dataset\\ch02\\cdc.txt",header = T)
cdc # data fraim으로 저장되어 있음을 확인할 수 있습니다.


cdc$genhlth #이전예제 math, phys와 다르게 벡터형태로 따로따로 저장되어있는 것이 아니므로 하나씩 성분별로 떼어내기 위해서는 $를 이용합니다.
cdc[,1] #matrix처럼 좌표를 불러와서 가지고오는 것도 가능합니다.







