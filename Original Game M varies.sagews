︠d2a4b8be-845d-4953-b7ee-72110af274c5s︠
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
                    put = floor(score/2)
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

︡ca196c25-e1f1-47e0-9661-f9c8fdb2fb57︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_uhltqx7m.svg","show":true,"text":null,"uuid":"bc79ac50-5009-456c-9f84-76a8b4865014"},"once":false}︡{"file":{"filename":"/tmp/tmp1bz9k7ja/tmp_f1p58kj5.svg","show":true,"text":null,"uuid":"a00f66e2-23cc-4c56-b06f-6c7f27aa4c85"},"once":false}︡{"stdout":"0.1574580875912985\n"}︡{"stdout":"1.745976530440508\n"}︡{"done":true}
︠88118381-7b6f-4469-a58e-116dce0240c0︠
︡4d3b753b-c86f-4a2f-bf6e-be162aadcb67︡
︠58f9c043-6ff1-4d65-b270-2eb09a8164das︠
%python
import matplotlib.pyplot as plt
log_EV = [pair[1] for pair in ExpectedValueLog ]
log_c = []
log_d = []
for i in range(11, 200):
    log_c.append(k*i + b - 2)
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
︡c2c5ee9b-7a1c-403b-b6b6-342f646b2904︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f60101f5dd0>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f601021f550>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f60102205d0>]\n"}︡{"stdout":"<matplotlib.legend.Legend object at 0x7f60123c3650>\n"}︡{"stdout":"Text(0.5, 0, 'M')\n"}︡{"stdout":"Text(0, 0.5, 'log(Expected number of rolls)')\n"}︡{"file":{"filename":"afc34bd9-281f-4acd-a5ec-a19929545596.svg","show":true,"text":null,"uuid":"87dd0a88-84e5-4507-a87b-44c2e5a94b21"},"once":false}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f60102938d0>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f6010277350>]\n"}︡{"stdout":"[<matplotlib.lines.Line2D object at 0x7f6010220a50>]\n"}︡{"stdout":"<matplotlib.legend.Legend object at 0x7f60102a3cd0>\n"}︡{"stdout":"Text(0.5, 0, 'M')\n"}︡{"stdout":"Text(0, 0.5, 'Expected number of rolls')\n"}︡{"file":{"filename":"0fe2c672-ef79-4187-bec1-e36f57d737ec.svg","show":true,"text":null,"uuid":"ad15141a-92a0-45c6-a1f7-8bc0344b0888"},"once":false}︡{"done":true}
︠11022da6-06ce-42b1-9a9b-b19b73e7d090︠

︡cbf230fa-59e6-469e-a171-48f55e475972︡{"done":true}
︠ffe13f02-0f11-488f-a7fb-970b86278fa8i︠









