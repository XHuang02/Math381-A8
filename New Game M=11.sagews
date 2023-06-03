︠875c14bf-1c0c-48a5-8892-aef5a8841839s︠
import numpy as np

M = 11
A = zero_matrix(QQ, M+1, M+1);
for i in range(6):
    A[0,i+1]=1/6
A[M,M]=1;
for i in range(1,M):
    for j in range(1,7):
        score = i + j
        if (score >= M):
            put = M
        else:
            if (is_prime(score) or is_prime(floor(score/2))):
                put = 0
            else:
                put = score
        A[i,put]+=1/6


Q = A[:M, :M]
N = (matrix.identity(M)-Q).inverse()

sum(N[0][i] for i in range(M))


probs_tot=[]
p_now = 0
for i in range(35):
    Ai = A^i
    p_now = Ai[0,M]
    probs_tot.append(p_now)

list_plot(probs_tot)

probs=[]
p_now = 0
p_pre = 0
for i in range(35):
    Ai = A^i
    p_now = Ai[0,M]
    p_exact = p_now-p_pre
    probs.append(p_exact)
    p_pre = p_now

list_plot(probs)
︡cadcf99c-9a20-457b-bd34-a24bbb620221︡{"stdout":"2946/373\n"}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_nt1rxgvs.svg","show":true,"text":null,"uuid":"381e9f32-8f41-4f3b-83f5-fa09a6184851"},"once":false}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_x5ld1d2s.svg","show":true,"text":null,"uuid":"be4819a2-c92d-4495-b248-8640d42b5872"},"once":false}︡{"done":true}









