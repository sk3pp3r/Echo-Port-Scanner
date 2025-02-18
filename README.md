<div align="center">

# 🔍 Echo-Port Scanner

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=flat&logo=docker&logoColor=white)](https://www.docker.com/)
[![Flask](https://img.shields.io/badge/flask-%23000.svg?style=flat&logo=flask&logoColor=white)](https://flask.palletsprojects.com/)
[![Python](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![Security: OWASP](https://img.shields.io/badge/security-OWASP-green.svg)](https://owasp.org/www-project-top-ten/)
[![Docker Build](https://github.com/sk3pp3r/echo/actions/workflows/docker-build.yml/badge.svg)](https://github.com/sk3pp3r/echo/actions/workflows/docker-build.yml)

A modern, secure web-based port scanning tool built with Flask and Docker. Featuring an intuitive interface, multiple output formats, and dark mode support.

[Features](#features) • [Quick Start](#quick-start) • [Security](#security) • [Documentation](#documentation) • [Screenshots](screenshots.md)

![Echo-Port Scanner Screenshot](screenshots/main.jpg)

</div>

## Features

- 🌐 **Web Interface**: Clean, modern UI with dark mode support
- 🎯 **Flexible Targeting**:
  - Single IP/hostname scanning
  - IP range support (e.g., 192.168.1.1-254)
  - Multiple target scanning
- 📊 **Multiple Export Formats**:
  - LOG (detailed scan output)
  - JSON (structured data)
  - CSV (spreadsheet-friendly)
- 🛡️ **Enterprise-Grade Security**:
  - OWASP Top 10 compliant
  - Rate limiting protection
  - Input sanitization
  - Security headers
- 🐳 **Container Ready**:
  - Docker support
  - Docker Compose configuration
  - Health checks included

## Quick Start

### Using Docker (Recommended)
```bash
# Clone the repository
git clone https://github.com/sk3pp3r/echo.git
cd echo

# Deploy using script
chmod +x deploy.sh
./deploy.sh

# Or manually with Docker Compose
docker-compose up -d
```

Access the application at `http://localhost:8085`

### Manual Installation
```bash
# Clone and setup
git clone https://github.com/sk3pp3r/echo.git
cd echo

# Create virtual environment
python -m venv venv
source venv/bin/activate  # Linux/Mac
# or
.\venv\Scripts\activate  # Windows

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py
```

## Security

### OWASP TOP 10 Security Enhancements
| **Type**               | **Enhancement**                     | **Details**                                                                                                                                       |
|--------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Environment Configuration 🔑   | Secret Key Management               | Uses environment variables for secrets, reducing hard-coded values           |
| Input Validation 🛡️| Target Validation                    | Robust hostname/IP validation blocking malicious inputs    |
| Command Security 🔐| Nmap Command Sanitization           | Whitelist approach for parameters, blocking command injection         |
| Rate Limiting ⏱️| Request Throttling                  | Prevents abuse with configurable request limits |
| Session Security 🍪| Secure Session Cookies              | Implements secure cookie configuration and lifetime limits |
| Data Protection 🔇| Output Sanitization               | Redacts sensitive information from scan results |
| Logging 📜| Enhanced Error Handling          | Comprehensive logging with rotation and unique error IDs            |
| Web Security 🔐| Security Headers           | Implements all recommended security headers |

## Documentation

### Scanning Options
- **Single Host**: `example.com` or `192.168.1.1`
- **IP Range**: `192.168.1.1-254`
- **Multiple Targets**: `192.168.1.10,10.0.0.138`
- **Port Formats**:
  - Single: `80`
  - Multiple: `80,443,8080`
  - Range: `1-1000`

### Export Formats
- **LOG**: Raw scan output with metadata
- **JSON**: Structured data format
- **CSV**: Spreadsheet-compatible format

## 🛠️ Development

### Project Structure
```
echo-port-scanner/
├── app.py                      # Main application
├── templates/                  # HTML templates
├── static/                    # Static assets
├── Dockerfile                 # Container definition
├── docker-compose.yml         # Container orchestration
└── requirements.txt           # Python dependencies
```

### Contributing
1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Author

**Haim Cohen**
- LinkedIn: [@haimc](https://www.linkedin.com/in/haimc/)
- GitHub: [@sk3pp3r](https://github.com/sk3pp3r)

## 🙏 Acknowledgments

- [Nmap](https://nmap.org/) - Network scanning capabilities
- [Flask](https://flask.palletsprojects.com/) - Web framework
- [Bootstrap](https://getbootstrap.com/) - UI components

## ⚠️ Disclaimer

This tool is for educational and authorized testing purposes only. Unauthorized scanning may be illegal. Use responsibly and only on networks you own or have permission to test.

---
<div align="center">
Made by Haim Cohen 2025
</div>
