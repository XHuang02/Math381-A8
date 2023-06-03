︠7c539392-1573-476e-af42-9c93cf1b2e2fs︠
import numpy as np

ExpectedValue = []
ExpectedValueLog = []
for M in range(11, 200):
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

    e =sum(N[0][i] for i in range(M))
    ExpectedValue.append([M,e])
    ExpectedValueLog.append([M,log(e)])

list_plot(ExpectedValue)
list_plot(ExpectedValueLog)


%python
x_values = np.array([pair[0] for pair in ExpectedValueLog], dtype=np.float64)
y_values = np.array([pair[1] for pair in ExpectedValueLog], dtype=np.float64)

# Fit a linear regression line to the data
coefficients = np.polyfit(x_values, y_values, 1)

# Extract the slope and y-intercept from the coefficients
k = coefficients[0]
b = coefficients[1]
print(k)
print(b)

︡25b6eb1d-323f-4bea-8c0c-27312a17ab91︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_i1n8z40x.svg","show":true,"text":null,"uuid":"b3cf9448-087d-48a0-a399-cb22c1e8c3ae"},"once":false}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_bcxhwn3t.svg","show":true,"text":null,"uuid":"20878146-9125-4e78-92c0-b00af6494341"},"once":false}︡{"stdout":"0.15888593225972072\n"}︡{"stdout":"2.596211877529695\n"}︡{"done":true}
︠88118381-7b6f-4469-a58e-116dce0240c0︠
︡4d3b753b-c86f-4a2f-bf6e-be162aadcb67︡
︠58f9c043-6ff1-4d65-b270-2eb09a8164das︠
%python
import matplotlib.pyplot as plt
log_EV = [pair[1] for pair in ExpectedValueLog ]
log_c = []
log_d = []
for i in range(11, 200):
    log_c.append(k*i + b - 2.5)
    log_d.append(k*i + b + 1.5)
y1 = log_EV
y2 = log_c
y3 = log_d
x = range(11,200)
fig, ax = plt.subplots()

ax.plot(x, y1, label = 'log(f(M))')
ax.plot(x, y2, label = 'log(c(M))')
ax.plot(x, y3, label = 'log(d(M))')

ax.legend()
ax.set_xlabel('M') 
ax.set_ylabel('log(Expected number of rolls)')

plt.show()
print(b-2.5)
print(b+1.5)

%python
import matplotlib.pyplot as plt
import numpy as np
c = np.exp(log_c)
d = np.exp(log_d)

y1 = np.array([pair[1] for pair in ExpectedValue])
y2 = c
y3 = d
x = range(11,200)
fig, ax = plt.subplots()

ax.plot(x, y1, label = 'f(M)')
ax.plot(x, y2, label = 'c(M)')
ax.plot(x, y3, label = 'd(M)')

ax.legend()
ax.set_xlabel('M') 
ax.set_ylabel('Expected number of rolls')

plt.show()
︡ca7f2578-5ede-45ea-9455-02d7eb5a7d43︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae507092d0>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae504d6690>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae5075b390>]\n"}︡{"stdout":"<matplotlib.legend.Legend object at 0x7fae50733a50>\n"}︡{"stdout":"Text(0.5, 0, 'M')\n"}︡{"stdout":"Text(0, 0.5, 'log(Expected number of rolls)')\n"}︡{"file":{"filename":"14d64dd8-8bff-40d8-8c78-a84a5f6eb490.svg","show":true,"text":null,"uuid":"b4788b79-9196-4833-a6bf-3093bc94612c"},"once":false}︡{"stdout":"0.09621187752969496\n"}︡{"stdout":"4.096211877529695\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae5054ba50>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae4e1b4210>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7fae4e1b6fd0>]\n"}︡{"stdout":"<matplotlib.legend.Legend object at 0x7fae506a7c10>\n"}︡{"stdout":"Text(0.5, 0, 'M')\n"}︡{"stdout":"Text(0, 0.5, 'Expected number of rolls')\n"}︡{"file":{"filename":"88a5f49b-954a-4a26-a401-2b4b96295053.svg","show":true,"text":null,"uuid":"236f8ba1-f222-4ea6-9e44-845d6d4a1871"},"once":false}︡{"done":true}









