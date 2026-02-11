<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ - KMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Sarabun', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #1a5276 0%, #3498db 50%, #85c1e9 100%);
            padding: 20px;
        }

        .login-container {
            background: white;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            width: 100%;
            max-width: 420px;
            overflow: hidden;
        }

        .login-header {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            padding: 40px 30px;
            text-align: center;
            position: relative;
        }

        .login-header::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 0;
            right: 0;
            height: 40px;
            background: white;
            border-radius: 50% 50% 0 0;
        }

        .logo-icon {
            width: 80px;
            height: 80px;
            background: white;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        .logo-icon i {
            font-size: 2.5rem;
            color: #3498db;
        }

        .login-header h1 {
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .login-header p {
            color: rgba(255,255,255,0.8);
            font-size: 0.95rem;
        }

        .login-form {
            padding: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #2c3e50;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 0.95rem;
        }

        .form-group label i {
            margin-right: 8px;
            color: #3498db;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper input {
            width: 100%;
            padding: 14px 16px 14px 48px;
            border: 2px solid #e8f4fc;
            border-radius: 12px;
            font-size: 1rem;
            font-family: 'Sarabun', sans-serif;
            transition: all 0.3s ease;
            background: #f8fbfd;
        }

        .input-wrapper input:focus {
            outline: none;
            border-color: #3498db;
            background: white;
            box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.1);
        }

        .input-wrapper .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: #95a5a6;
            font-size: 1.1rem;
        }

        .input-wrapper .toggle-password {
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #95a5a6;
            cursor: pointer;
            font-size: 1.1rem;
        }

        .input-wrapper .toggle-password:hover {
            color: #3498db;
        }

        .form-options {
            display: flex;
            align-items: center;
            margin-bottom: 24px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
        }

        .remember-me input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #3498db;
        }

        .remember-me span {
            color: #5d6d7e;
            font-size: 0.9rem;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            font-family: 'Sarabun', sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #2980b9, #1a5276);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(52, 152, 219, 0.4);
        }

        .btn-login.loading {
            opacity: 0.8;
            pointer-events: none;
        }

        .error-message {
            background: #fdf2f2;
            border: 1px solid #f5c6cb;
            color: #c0392b;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: none;
            align-items: center;
            gap: 10px;
            font-size: 0.9rem;
        }

        .error-message.show {
            display: flex;
        }

        .success-message {
            background: #e8f8f0;
            border: 1px solid #a3e4bc;
            color: #1e8449;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: none;
            align-items: center;
            gap: 10px;
            font-size: 0.9rem;
        }

        .success-message.show {
            display: flex;
        }

        .login-footer {
            text-align: center;
            padding: 20px;
            background: #f8fbfd;
            border-top: 1px solid #e8f4fc;
        }

        .login-footer p {
            color: #95a5a6;
            font-size: 0.85rem;
        }

        @media (max-width: 768px) {
            body { padding: 16px; }
            .login-container { border-radius: 20px; }
            .login-header { padding: 30px 20px; }
            .logo-icon { width: 70px; height: 70px; }
            .logo-icon i { font-size: 2rem; }
            .login-header h1 { font-size: 1.3rem; }
            .login-form { padding: 25px 20px; }
        }

        @media (max-width: 380px) {
            .login-header { padding: 25px 15px; }
            .login-form { padding: 20px 15px; }
            .login-header h1 { font-size: 1.2rem; }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <div class="logo-icon">
                <i class="fas fa-industry"></i>
            </div>
            <h1>Knowledge Management System</h1>
            <p>ระบบจัดการความรู้สายการผลิต</p>
        </div>

        <form class="login-form" id="loginForm" onsubmit="handleLogin(event)">
            <div class="error-message" id="errorMessage">
                <i class="fas fa-exclamation-circle"></i>
                <span id="errorText">รหัสพนักงานหรือรหัสผ่านไม่ถูกต้อง</span>
            </div>

            <div class="success-message" id="successMessage">
                <i class="fas fa-check-circle"></i>
                <span>เข้าสู่ระบบสำเร็จ กำลังนำท่านไปยังหน้าหลัก...</span>
            </div>

            <div class="form-group">
                <label for="employeeId">
                    <i class="fas fa-id-card"></i>รหัสพนักงาน
                </label>
                <div class="input-wrapper">
                    <input type="text" id="employeeId" name="employeeId" placeholder="กรอกรหัสพนักงาน" required>
                    <i class="fas fa-user input-icon"></i>
                </div>
            </div>

            <div class="form-group">
                <label for="password">
                    <i class="fas fa-lock"></i>รหัสผ่าน
                </label>
                <div class="input-wrapper">
                    <input type="password" id="password" name="password" placeholder="กรอกรหัสผ่าน" required>
                    <i class="fas fa-key input-icon"></i>
                    <button type="button" class="toggle-password" onclick="togglePassword()">
                        <i class="fas fa-eye" id="toggleIcon"></i>
                    </button>
                </div>
            </div>

            <div class="form-options">
                <label class="remember-me">
                    <input type="checkbox" id="rememberMe">
                    <span>จดจำการเข้าสู่ระบบ</span>
                </label>
            </div>

            <button type="submit" class="btn-login" id="btnLogin">
                <i class="fas fa-sign-in-alt"></i>
                <span>เข้าสู่ระบบ</span>
            </button>
        </form>

        <div class="login-footer">
            <p>© 2024 Production Line - Knowledge Management System</p>
        </div>
    </div>

    <script>
        // ✅ URL ใหม่สำหรับ Login API
        const API_URL = 'https://script.google.com/macros/s/AKfycby4zX4D6zxAotFGIbWTXyeJ6DCRCHTKokFVxKMio4RlZEq8ANq5wW_K-pTK5wWOszRz_Q/exec';

        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.getElementById('toggleIcon');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            }
        }

        function showError(message) {
            const errorDiv = document.getElementById('errorMessage');
            const errorText = document.getElementById('errorText');
            const successDiv = document.getElementById('successMessage');
            
            successDiv.classList.remove('show');
            errorText.textContent = message;
            errorDiv.classList.add('show');
            
            setTimeout(function() {
                errorDiv.classList.remove('show');
            }, 5000);
        }

        function showSuccess() {
            const errorDiv = document.getElementById('errorMessage');
            const successDiv = document.getElementById('successMessage');
            
            errorDiv.classList.remove('show');
            successDiv.classList.add('show');
        }

        async function handleLogin(event) {
            event.preventDefault();
            
            const employeeId = document.getElementById('employeeId').value.trim();
            const password = document.getElementById('password').value;
            const rememberMe = document.getElementById('rememberMe').checked;
            const btnLogin = document.getElementById('btnLogin');
            
            if (!employeeId || !password) {
                showError('กรุณากรอกรหัสพนักงานและรหัสผ่าน');
                return;
            }

            btnLogin.classList.add('loading');
            btnLogin.innerHTML = '<i class="fas fa-spinner fa-spin"></i><span>กำลังเข้าสู่ระบบ...</span>';

            try {
                const url = API_URL + '?action=login&employeeId=' + encodeURIComponent(employeeId) + '&password=' + encodeURIComponent(password);
                const response = await fetch(url);
                const result = await response.json();
                
                if (result.success) {
                    const userData = {
                        employeeId: result.user.employeeId,
                        name: result.user.name,
                        role: result.user.role,
                        department: result.user.department,
                        loginTime: new Date().toISOString()
                    };

                    if (rememberMe) {
                        localStorage.setItem('currentUser', JSON.stringify(userData));
                        localStorage.setItem('savedEmployeeId', employeeId);
                    } else {
                        sessionStorage.setItem('currentUser', JSON.stringify(userData));
                        localStorage.removeItem('savedEmployeeId');
                    }

                    showSuccess();

                    setTimeout(function() {
                        window.location.href = 'index.html';
                    }, 1000);
                    
                } else {
                    showError(result.message || 'รหัสพนักงานหรือรหัสผ่านไม่ถูกต้อง');
                    resetButton();
                }
                
            } catch (error) {
                console.error('Login error:', error);
                showError('ไม่สามารถเชื่อมต่อระบบได้ กรุณาลองใหม่');
                resetButton();
            }
        }

        function resetButton() {
            const btnLogin = document.getElementById('btnLogin');
            btnLogin.classList.remove('loading');
            btnLogin.innerHTML = '<i class="fas fa-sign-in-alt"></i><span>เข้าสู่ระบบ</span>';
            document.getElementById('password').value = '';
            document.getElementById('password').focus();
        }

        window.onload = function() {
            const user = localStorage.getItem('currentUser') || sessionStorage.getItem('currentUser');
            if (user) {
                window.location.href = 'index.html';
            }

            const savedId = localStorage.getItem('savedEmployeeId');
            if (savedId) {
                document.getElementById('employeeId').value = savedId;
                document.getElementById('rememberMe').checked = true;
                document.getElementById('password').focus();
            } else {
                document.getElementById('employeeId').focus();
            }
        };

        document.getElementById('employeeId').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                e.preventDefault();
                document.getElementById('password').focus();
            }
        });
    </script>
</body>
</html>
