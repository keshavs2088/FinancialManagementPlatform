import "./LoginPage.css";
import finLumeLogo from "../../assets/finlume-logo.svg";
import growthIllustration from "../../assets/login/financial-growth-login.svg";
import envelopeImageEmail from "../../assets/login/envelopeEmail.png";
import lockImagePassword from "../../assets/login/lockPassword.png";
import { Eye, EyeOff } from "lucide-react";
import { useState } from "react";
function LoginPage() {
  const [showPassword, setShowPassword] = useState(false);
  return (
    <main className="login-page">
      <section className="login-branding-section">
        <img src={finLumeLogo} alt="finLume logo" className="finlume-logo" />
        <p>Clarity for your business finances.</p>

        <img
          src={growthIllustration}
          alt="Financial growth illustration"
          className="growth-illustration"
        />
      </section>
      <section className="login-form-section">
        <h1>Welcome Back</h1>
        <p>Log in to your FinLume account</p>

        <form className="login-form">
          <label htmlFor="email" className="email">
            Email
          </label>
          <div className="input-wrapper">
            <img src={envelopeImageEmail} alt="" className="input-icon" />
            <input
              id="email"
              type="email"
              placeholder="Enter your email"
              required
            />
          </div>
          <label htmlFor="password" className="password">
            Password
          </label>
          <div className="input-wrapper">
            <img src={lockImagePassword} alt="" className="input-icon" />
            <input
              id="password"
              type={showPassword ? "text" : "password"}
              placeholder="Enter your password"
              required
            />
            <button
              type="button"
              className="password-toggle"
              aria-label={showPassword ? "Hide password" : "Show password"}
              onClick={() => setShowPassword(!showPassword)}
            >
              {showPassword ? (
                <Eye size={20} color="grey" />
              ) : (
                <EyeOff size={20} color="grey" />
              )}
            </button>
          </div>
          <div className="remember-me-section">
            <label className="remember_me">
              <input type="checkbox" id="remember_me" disabled />
              Remember me
            </label>
            <button type="button" className="secondary_button">
              Forgot password?
            </button>
          </div>
          <button type="submit" className="log-in">
            Log In
          </button>
          <div className="new-user">
            <p>Don't have an account?</p>
            <button type="button" className="secondary_button">
              Register now
            </button>
          </div>
        </form>
      </section>
    </main>
  );
}

export default LoginPage;
