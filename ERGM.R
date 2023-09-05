library(graph)
library(igraph)
library(Rgraphviz)
library(gRbase)
library(RBGL)
library(graphics)
library(gRim)
library(qgraph)
library(lcd)
library(network)
library(sna)
library(ergm)
library(ggplot2)

s <- graph(n=44, edges=c()) # 노드 44, 엣지 0 빈 그래프 객체 생성

edges <- read.csv("C:/Users/my/Desktop/company/final_edges.csv") # 엣지 파일
e <- c()
for (i in 1:nrow(edges)) {
  e <- c(e, edges$from[i], edges$to[i])}

ss <- s + edge(e) # 엣지 추가
E(ss)$weight <- edges$ans # 엣지 속성 가중치로 추가

n <- read.csv("C:/Users/my/Desktop/company/final_node.csv") # 노드 파일

V(ss)$name <- n$name # 노드 이름(번호) 속성 추가
V(ss)$gender <- n$gender # 노드 성별 속성 추가
V(ss)$level <- n$level # 노드 직급 속성 추가
V(ss)$location <- n$location # 노드 도시 속성 추가
V(ss)$region <- n$region # 노드 지역 속성 추가

company <- ss # 최종
company
is.weighted(company) # TRUE
