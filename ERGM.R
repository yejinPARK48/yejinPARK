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

s <- graph(n=44, edges=c()) # ��� 44, ���� 0 �� �׷��� ��ü ����

edges <- read.csv("C:/Users/my/Desktop/company/final_edges.csv") # ���� ����
e <- c()
for (i in 1:nrow(edges)) {
  e <- c(e, edges$from[i], edges$to[i])}

ss <- s + edge(e) # ���� �߰�
E(ss)$weight <- edges$ans # ���� �Ӽ� ����ġ�� �߰�

n <- read.csv("C:/Users/my/Desktop/company/final_node.csv") # ��� ����

V(ss)$name <- n$name # ��� �̸�(��ȣ) �Ӽ� �߰�
V(ss)$gender <- n$gender # ��� ���� �Ӽ� �߰�
V(ss)$level <- n$level # ��� ���� �Ӽ� �߰�
V(ss)$location <- n$location # ��� ���� �Ӽ� �߰�
V(ss)$region <- n$region # ��� ���� �Ӽ� �߰�

company <- ss # ����
company
is.weighted(company) # TRUE