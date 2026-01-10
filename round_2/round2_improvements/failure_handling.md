Failure Handling Protocol
Firebase Authentication Failure (Mobile App)
What happens:

Login fails (error 401 or 403)
App shows error message to user
Saves error details in local storage + console log
How we report it:

Create new GitHub Issue titled:
"[URGENT] Firebase Login Failure – AiVa App"

In the issue we include:

Full error message and code
Time and date it happened
Which user/phone it occurred on
Steps to repeat the problem
Screenshot of console/network tab
Send email/Slack to backend developer with subject:
"[CRITICAL] AiVa – Firebase Auth Problem"

Attachment:

Console logs
Network request screenshot
Steps + timestamp