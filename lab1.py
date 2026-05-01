import numpy as np
import matplotlib.pyplot as plt

#  МОДЕЛЬ 1 
def y1_analytic(t):
    return (10/3) - 4*np.exp(-0.5*t) + (2/3)*np.exp(-3*t)

def euler_model1(t_end=10, h=0.01):
    t = np.arange(0, t_end + h, h)
    y = np.zeros_like(t)
    dy = np.zeros_like(t)
    for i in range(1, len(t)):
        x = 1.0
        d2y = (x - 0.7 * dy[i-1] - 0.3 * y[i-1]) / 0.2
        dy[i] = dy[i-1] + d2y * h
        y[i] = y[i-1] + dy[i-1] * h
    return t, y

#  МОДЕЛЬ 2
def y2_analytic(t):
    return 1.25*t - 0.3125 + 0.3125*np.exp(-4*t)

def euler_model2(t_end=10, h=0.01):
    t = np.arange(0, t_end + h, h)
    y = np.zeros_like(t)
    dy = np.zeros_like(t)
    for i in range(1, len(t)):
        x = 1.0
        d2y = (x - 0.8 * dy[i-1]) / 0.2
        dy[i] = dy[i-1] + d2y * h
        y[i] = y[i-1] + dy[i-1] * h
    return t, y

#  ЧАСТОТНІ ХАРАКТЕРИСТИКИ 
omega = np.logspace(-1, 2, 1000)

# Модель 1
W1 = 1 / (0.2*(1j*omega)**2 + 0.7*1j*omega + 0.3)
A1 = np.abs(W1)
phi1 = np.angle(W1, deg=True)

# Модель 2
W2 = 1 / (0.2*(1j*omega)**2 + 0.8*1j*omega)
A2 = np.abs(W2)
phi2 = np.angle(W2, deg=True)

#  ПОБУДОВА ГРАФІКІВ
plt.rcParams['figure.figsize'] = (10, 6)

# 1. Перехідна характеристика модель 1
t1, y_num1 = euler_model1()
plt.plot(t1, y1_analytic(t1), 'b-', linewidth=2, label='Аналітичний')
plt.plot(t1, y_num1, 'r--', linewidth=2, label='Числовий (Ейлер)')
plt.title('Перехідна характеристика моделі 1 (варіант 4)')
plt.xlabel('t, с')
plt.ylabel('y(t)')
plt.grid(True)
plt.legend()
plt.savefig('graph_model1_time.png', dpi=300, bbox_inches='tight')
plt.close()

# 2. Перехідна характеристика модель 2
t2, y_num2 = euler_model2()
plt.plot(t2, y2_analytic(t2), 'b-', linewidth=2, label='Аналітичний')
plt.plot(t2, y_num2, 'r--', linewidth=2, label='Числовий (Ейлер)')
plt.title('Перехідна характеристика моделі 2 (варіант 4)')
plt.xlabel('t, с')
plt.ylabel('y(t)')
plt.grid(True)
plt.legend()
plt.savefig('graph_model2_time.png', dpi=300, bbox_inches='tight')
plt.close()

# 3. АЧХ модель 1
plt.semilogx(omega, A1, 'b-', linewidth=2)
plt.title('АЧХ моделі 1 (варіант 4)')
plt.xlabel('ω, рад/с')
plt.ylabel('A(ω)')
plt.grid(True)
plt.savefig('graph_model1_ach.png', dpi=300, bbox_inches='tight')
plt.close()

# 4. АЧХ модель 2
plt.semilogx(omega, A2, 'b-', linewidth=2)
plt.title('АЧХ моделі 2 (варіант 4)')
plt.xlabel('ω, рад/с')
plt.ylabel('A(ω)')
plt.grid(True)
plt.savefig('graph_model2_ach.png', dpi=300, bbox_inches='tight')
plt.close()

# 5. ФЧХ модель 1
plt.semilogx(omega, phi1, 'b-', linewidth=2)
plt.title('ФЧХ моделі 1 (варіант 4)')
plt.xlabel('ω, рад/с')
plt.ylabel('φ(ω), °')
plt.grid(True)
plt.savefig('graph_model1_fch.png', dpi=300, bbox_inches='tight')
plt.close()

# 6. ФЧХ модель 2
plt.semilogx(omega, phi2, 'b-', linewidth=2)
plt.title('ФЧХ моделі 2 (варіант 4)')
plt.xlabel('ω, рад/с')
plt.ylabel('φ(ω), °')
plt.grid(True)
plt.savefig('graph_model2_fch.png', dpi=300, bbox_inches='tight')
plt.close()

# 7. АФЧХ модель 1
plt.plot(np.real(W1), np.imag(W1), 'b-', linewidth=2)
plt.title('АФЧХ моделі 1 (варіант 4)')
plt.xlabel('Re')
plt.ylabel('Im')
plt.grid(True)
plt.axis('equal')
plt.savefig('graph_model1_afch.png', dpi=300, bbox_inches='tight')
plt.close()

# 8. АФЧХ модель 2
plt.plot(np.real(W2), np.imag(W2), 'b-', linewidth=2)
plt.title('АФЧХ моделі 2 (варіант 4)')
plt.xlabel('Re')
plt.ylabel('Im')
plt.grid(True)
plt.axis('equal')
plt.savefig('graph_model2_afch.png', dpi=300, bbox_inches='tight')
plt.close()

print("Всі 8 графіків успішно збережено!")

