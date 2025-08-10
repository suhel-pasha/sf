## **1. OAuth vs OAuth 2.0 — Core Differences**

### **OAuth (1.0 / 1.0a)**

* **Released:** 2010 (OAuth 1.0a final)
* **Security method:**

  * Uses **cryptographic signatures** for every request.
  * Both client and server need to share a **secret key** and use it to sign requests.
* **Token type:**

  * Access tokens are usually **long-lived** unless explicitly revoked.
* **Complexity:**

  * More complex for developers because every API call must be signed.
* **Transport:**

  * Can work over plain HTTP (because of signatures), but HTTPS is still recommended.
* **Downside:**

  * Harder to implement, more computation-heavy, less flexible for modern apps.

---

### **OAuth 2.0**

* **Released:** 2012
* **Security method:**

  * Uses **bearer tokens** (like a ticket – if you have it, you’re in).
  * Relies on **HTTPS** for security rather than request signing.
* **Token types:**

  * **Access Tokens** (short-lived) and **Refresh Tokens** (to get new access tokens without re-login).
* **Flows (Grant Types):**

  * **Authorization Code** (web apps)
  * **Implicit** (single-page apps — now discouraged)
  * **Client Credentials** (server-to-server)
  * **Resource Owner Password** (legacy; discouraged)
  * **Device Code** (IoT devices)
* **Complexity:**

  * Easier for developers, but requires careful handling to avoid token leakage.
* **Flexibility:**

  * Designed for mobile, web, desktop, IoT.

---

💡 **Quick Interview Comparison Table:**

| Feature              | OAuth 1.0                | OAuth 2.0                           |
| -------------------- | ------------------------ | ----------------------------------- |
| Security             | Cryptographic signatures | Bearer tokens + HTTPS               |
| Token lifetime       | Often long-lived         | Short-lived + refresh tokens        |
| Implementation       | Complex                  | Easier                              |
| Mobile & SPA support | Limited                  | Excellent                           |
| Standard grant types | Few                      | Multiple (Authorization Code, etc.) |

---

## **2. Salesforce & OAuth 2.0**

Salesforce uses **OAuth 2.0** for authentication and authorization in:

* **Connected Apps** (third-party integration)
* **Single Sign-On (SSO)**
* **API access** (REST, SOAP, Bulk API)

### **Salesforce OAuth 2.0 Flow Example**

1. **User tries to access an external app** that needs Salesforce data.
2. The app redirects the user to Salesforce **login & consent screen**.
3. The user logs in and grants access.
4. Salesforce sends back an **Authorization Code**.
5. The app exchanges the code for an **Access Token** (and possibly a Refresh Token).
6. The app uses the Access Token to call Salesforce APIs **without needing user credentials again**.

---

### **Why Salesforce Chooses OAuth 2.0**

* Supports **multiple grant types** for different client types.
* Better suited for **mobile & cloud** applications.
* **Bearer token** approach works well with HTTPS-only Salesforce endpoints.
* Tokens can be **revoked** or **scoped** (e.g., read-only access).

---

💬 **How You Could Answer in an Interview:**

> *"OAuth 1.0 used cryptographic signatures for request authentication, which was secure but complicated. OAuth 2.0 simplified this by using bearer tokens over HTTPS, allowing more flexibility, better mobile and web app support, and multiple grant types.
> In Salesforce, OAuth 2.0 is the standard for authenticating external apps and APIs. For example, when creating a Connected App, we configure OAuth scopes and a callback URL, then use an OAuth flow like Authorization Code to get an access token. This token lets the app access Salesforce data without exposing user credentials."*

---

If you want, I can also make you a **diagram of OAuth 2.0 flow in Salesforce** so you can **memorize it visually** for interviews. Would you like me to?
