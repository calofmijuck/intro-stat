##Lec03

##vector
x<-c(1,3,5,7)
y<-c(2,4,6)

z<-x+y  ##길이가 달라 warning이 발생하나, 연산은 된다. 

z ##대신 7에는 y의 첫번째 숫자 2가 더해짐

x[1]  ##x의 첫번째 원소를 출력

x2<-x[2] ##x의 두번째 원소를 저장
x2

x[c(1,3,4)] ##x의 1,3,4번째 원소를 출력
x[-2] ##x의 두번째 원소를 제외하고 출력
x[-c(2,3)]  ##x의 2,3번째 원소를 제외하고 출력


seq(from=1, to=10, by=1) ##1부터 10까지 1간격으로 벡터 생성
seq(from=1, to=15, length=10) ##1부터 15까지 길이가 10인 등간격 벡터 생성
seq(from=1, by=2, length=10) ##1부터 길이가 10인 2간격의 벡터생성
seq(f=1, b=2, le=10)

##정수벡터
3:10
10:3
rep(3,5)
rep(c(1,2,3),times = 2) ##1,2,3을 두번 반복
rep(c(1,2,3),2) ##times는 굳이 안써도 다음숫자로 입력가능
rep(c(1,2,3),each = 2) ##112233으로 출력

##matrices
a1 <- c(1,2,3,4)
a2 <- c(5,6,7,8)
a3 <- c(9,10,11,12)

mat <- rbind(a1,a2,a3) ##row bind 
mat

mat1 <- cbind(a1,a2,a3) ##column bind
mat1

mat[1,3] ##1번째 행, 3번째 열의 원소 출력
mat[3,2] ##3번째 행, 2번째 열의 원소 출력
mat[1:3,3] ##3번째 열의 1,2,3번행의 원소를 순서대로 출력
mat[,3] ##3번째 열의 원소를 모두 출력
mat[c(2,1,3),3] ####3번째 열의 2,1,3번행의 원소를 순서대로 출력

##여러함수들
abs(-1) ##절대값
sqrt(4) ##제곱근
round(1.345,digits=2)
round(1.345,digits=1) ##소수digits번째 자리까지 반올림 (올림 : ceiling, 내림 : floor)
log(2) ##자연로그

choose(5,3) ##조합
factorial(5) ##순열


z <- 8

paste("a","b","c") ##주어진 문자열 붙이기
paste("z = ",z,", and log(z) = ",round(log(z),digits = 2))


x <- 7 ; y <- 2;

x^y ##승수연산
x%%y ##나머지
x%/%y ##몫
print(x)

##True는 1, False는 0으로 취급
x<y ##대소비교, true(1) or false(0) 로 출력
x>y ##등호조건 : >=,<=
x==y ##양변이 동일하면 true, 아니면 false
x!=y ##양변이 다르면 true, 아니면 false
##|는 or, &는 and로 조건문(if)에서 많이 사용

as.numeric(x==y)##True는 1, False는 0으로 취급
as.numeric(x!=y)



##for & if문
for(i in 1:3){ x<-i+1; print(x)} ##i가 1,2,3순서로 변하면서 뒤에 명령어를 순차적으로 실행
for(i in 1:3){ x<-i+1; x}




for(j in 5:1){ print(j)} ##j가 들어있는 벡터에 변화를 주면서 명령어 실행의 형태를 바꿀 수 있다.(5,4,3,2,1)순서


if(3<5) {print("yes")} ##if 괄호안에 조건이 맞을경우 뒤에 명령어를 실행

if(3>5) {print("yes")} ##False일 경우에는 실행하지 않는다.

if(3>5) {print("yes")} else {print("no")} ##False일 경우에 실행되는 명령어를 else{}로 입력할 수 있다.

for(i in 1:10){
  if(i%%2==0) {print(i)}
}

##2로나누어 떨어지는 경우에만 print
















