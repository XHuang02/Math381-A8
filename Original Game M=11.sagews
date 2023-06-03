︠24fe0796-1f4b-46ec-9dfa-129592d9e06as︠
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
                put = floor(score/2)
            else:
                put = score
        A[i,put]+=1/6


Q = A[:M, :M]
N = (matrix.identity(M)-Q).inverse()
A^3
# sum(N[0][i] for i in range(M))


probs_tot=[]
p_now = 0
for i in range(30):
    Ai = A^i
    p_now = Ai[0,M]
    probs_tot.append(p_now)

list_plot(probs_tot)

probs=[]
p_now = 0
p_pre = 0
for i in range(30):
    Ai = A^i
    p_now = Ai[0,M]
    p_exact = p_now-p_pre
    probs.append(p_exact)
    p_pre = p_now

list_plot(probs)
︡4a155122-f7f9-46ab-af5c-fc0e38032c72︡{"stdout":"[      0  13/216    7/36     2/9       0    1/18       0       0    7/72  19/216       0  61/216]\n[      0     1/9    5/18    5/18       0    1/36       0       0     1/9    2/27       0  13/108]\n[      0    1/12     2/9  25/108       0    1/27       0       0    7/72    5/72       0    7/27]\n[      0    1/18     1/6    5/27       0    1/24       0       0    1/12   7/108       0   29/72]\n[      0    1/27    5/36     1/6       0  11/216       0       0  17/216    5/72       0   11/24]\n[      0    1/54    5/54  13/108       0   5/108       0       0  13/216    1/18       0 131/216]\n[      0   1/108    1/18    1/12       0    1/27       0       0    1/24    1/24       0  79/108]\n[      0       0    1/54   5/108       0    1/36       0       0   5/216    1/36       0 185/216]\n[      0       0    1/54    1/27       0    1/54       0       0    1/54   5/216       0 191/216]\n[      0       0    1/54    1/36       0    1/72       0       0    1/72    1/54       0   49/54]\n[      0       0       0       0       0       0       0       0       0       0       0       1]\n[      0       0       0       0       0       0       0       0       0       0       0       1]\n"}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_vafoqper.svg","show":true,"text":null,"uuid":"2753866c-7c23-427d-8d6a-07d0a30c647d"},"once":false}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_upgi2dqx.svg","show":true,"text":null,"uuid":"773f784f-8c3a-4bbf-8008-c7924af4adb6"},"once":false}︡{"done":true}









