<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DevOps JSP Web Portal</title>
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --accent: #10b981;
            --bg: #f8fafc;
            --card-bg: #ffffff;
            --text-dark: #0f172a;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
        }

        body {
            background-color: var(--bg);
            color: var(--text-dark);
            line-height: 1.6;
            padding: 0;
            margin: 0;
        }

        header {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            color: #ffffff;
            padding: 2.5rem 2rem;
            text-align: center;
            border-bottom: 4px solid var(--primary);
        }

        header h1 {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        header p {
            color: #94a3b8;
            font-size: 1.05rem;
        }

        .status-badge {
            display: inline-block;
            background-color: rgba(16, 185, 129, 0.15);
            color: var(--accent);
            border: 1px solid var(--accent);
            padding: 0.25rem 0.85rem;
            border-radius: 9999px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-top: 1rem;
        }

        .container {
            max-width: 1000px;
            margin: 2rem auto;
            padding: 0 1.5rem;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .card {
            background: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 1.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .card h2 {
            font-size: 1.25rem;
            color: var(--text-dark);
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .card p {
            color: var(--text-muted);
            font-size: 0.95rem;
            margin-bottom: 1rem;
        }

        .info-list {
            list-style: none;
        }

        .info-list li {
            padding: 0.5rem 0;
            border-bottom: 1px solid var(--border);
            font-size: 0.9rem;
            display: flex;
            justify-content: space-between;
        }

        .info-list li:last-child {
            border-bottom: none;
        }

        .info-label {
            color: var(--text-muted);
            font-weight: 500;
        }

        .info-value {
            color: var(--text-dark);
            font-weight: 600;
            font-family: monospace;
        }

        footer {
            text-align: center;
            padding: 2rem;
            color: var(--text-muted);
            font-size: 0.875rem;
            border-top: 1px solid var(--border);
            margin-top: 3rem;
            background-color: #ffffff;
        }
    </style>
</head>
<body>

    <header>
        <h1>DevOps Automated Deployment Demo</h1>
        <p>Built with Apache Maven • CI/CD via Jenkins • Hosted on Apache Tomcat</p>
        <div class="status-badge">● Deployment Status: Active</div>
    </header>

    <div class="container">
        <div class="grid">
            <!-- Runtime Server Information Card -->
            <div class="card">
                <h2> Server Environment</h2>
                <p>Real-time environment details generated dynamically by JSP execution on Apache Tomcat.</p>
                <ul class="info-list">
                    <li>
                        <span class="info-label">Server Info:</span>
                        <span class="info-value"><%= application.getServerInfo() %></span>
                    </li>
                    <li>
                        <span class="info-label">Java Version:</span>
                        <span class="info-value"><%= System.getProperty("java.version") %></span>
                    </li>
                    <li>
                        <span class="info-label">OS Name:</span>
                        <span class="info-value"><%= System.getProperty("os.name") %></span>
                    </li>
                    <li>
                        <span class="info-label">Context Path:</span>
                        <span class="info-value"><%= request.getContextPath() %></span>
                    </li>
                </ul>
            </div>

            <!-- Build & Pipeline Info Card -->
            <div class="card">
                <h2> Pipeline Metadata</h2>
                <p>Information about the underlying Maven project structure and build execution.</p>
                <ul class="info-list">
                    <li>
                        <span class="info-label">Artifact ID:</span>
                        <span class="info-value">jsp-devops-app</span>
                    </li>
                    <li>
                        <span class="info-label">Packaging:</span>
                        <span class="info-value">WAR</span>
                    </li>
                    <li>
                        <span class="info-label">Build Tool:</span>
                        <span class="info-value">Apache Maven</span>
                    </li>
                    <li>
                        <span class="info-label">Server Timestamp:</span>
                        <span class="info-value">
                            <% 
                                LocalDateTime now = LocalDateTime.now();
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
                                out.print(now.format(formatter));
                            %>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <footer>
        <p>Managed via GitHub & Jenkins CI/CD Pipeline • Continuous Integration & Deployment Demonstration</p>
    </footer>

</body>
</html>
