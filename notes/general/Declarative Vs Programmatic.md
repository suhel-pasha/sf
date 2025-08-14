<details>
<summary>⚡ Declarative vs Programmatic</summary>

## 1️⃣ The Core Difference

| Aspect          | Declarative Development                                                   | Programmatic Development                                          |
| --------------- | ------------------------------------------------------------------------- | ------------------------------------------------------------------ |
| **Definition**  | Point-and-click configuration using Salesforce’s built-in tools.         | Writing custom code (Apex, LWC, Aura, etc.).                       |
| **Tools**       | Flow Builder, Approval Processes, Validation Rules, Page Layouts, App Builder | Apex Classes & Triggers, Lightning Web Components, Visualforce, SOQL/SOSL |
| **Complexity**  | Best for **simple to moderately complex** requirements.                   | Best for **complex, highly customized** requirements.              |
| **Maintenance** | Easier to maintain, less risk.                                            | Requires maintenance, testing, deployments.                        |
| **Performance** | Optimized internally by Salesforce.                                       | Developer must ensure performance/scalability.                     |

---

## 2️⃣ How to Decide

**Rule:** _Start declarative, go programmatic if needed._

1. **Check if it’s possible declaratively** → If yes, use declarative.
2. **Assess complexity** → Loops, recursion, multi-object logic? → Go Apex.
3. **Consider performance & limits** → If declarative hits limits → Go Apex.
4. **Maintenance & skillset** → Admin-maintained? → Declarative.

---

## 3️⃣ Common Examples

| Requirement                                        | Preferred Approach      | Why                                                  |
| -------------------------------------------------- | ----------------------- | ---------------------------------------------------- |
| Send email on Case closure                         | Declarative (Flow)      | Simple automation                                    |
| Auto-update related records w/ complex filtering   | Apex Trigger            | Multi-object logic                                   |
| Custom UI for data entry                           | LWC                     | Interactive, dynamic UI                              |
| Approval process for expense reports               | Declarative (Approval)  | Built-in feature                                     |
| Integration with external payment gateway          | Apex                    | Requires HTTP callouts & custom handling             |

---

## 4️⃣ Interview Answer

> "Declarative development uses tools like Flow, Validation Rules, and Approval Processes — faster to build and easier to maintain for simpler needs. Programmatic development uses Apex, LWC, or Visualforce for complex logic, integrations, or UI.  
> My approach: start declarative to leverage Salesforce’s capabilities, and move to programmatic only if requirements exceed what’s possible declaratively — e.g., for complex data processing, API integrations, or custom UI."

---

✅ **Pro Tip:** Mention **governor limits, maintainability, and complexity** when deciding.

</details>

---

<details>
<summary>🔄 Flows</summary>

## 1️⃣ What Are Flows?

Declarative automation tool to collect, process, and manipulate Salesforce data without code. More powerful than Workflow Rules/Process Builder.

---

## 2️⃣ Types of Flows

1. **Record-Triggered** – Runs on record create/update/delete.  
2. **Scheduled-Triggered** – Runs at a set time or interval.  
3. **Screen Flow** – Interactive, takes user input.  
4. **Autolaunched** – No UI, triggered by Apex/Flows/REST API.

---

## 3️⃣ Use Cases

- Auto-update related records  
- Send emails/notifications  
- Create records from events  
- Data cleanup jobs (scheduled)  
- Multi-object business logic

**Example:** On Opportunity Closed Won → update Account status, create task, send email.

---

## 4️⃣ Calling APIs from Flows

- **Since Winter ’23** → Direct REST API callouts using **HTTP Callout** action.  
- **Before Winter ’23** → Call an Apex method from Flow to handle API call.

---

## 5️⃣ Interview Answer

> "Flows are Salesforce's most powerful declarative automation tool, running on triggers, schedules, or user input. I use them for updating related records, sending notifications, or guiding data entry. Since Winter '23, Flows can make REST API callouts directly; before that, we used Apex for callouts."

</details>

---

<details>
<summary>🌐 Integrations</summary>

## Definition
Salesforce integrations enable data exchange with external systems. Broad categories:

- **Inbound** – External → Salesforce  
- **Outbound** – Salesforce → External  

---

<details>
<summary>📥 Inbound (External → Salesforce)</summary>

**Definition:** External systems send data/requests into Salesforce.

**Methods:**
- REST API (JSON)
- SOAP API (XML)
- Bulk API v1/v2 (large data)
- Apex REST/SOAP (custom endpoints)
- Platform Events (external publish)

**Security:** OAuth 2.0, Named Credentials, JWT.

**Example:** ERP pushes invoices to Salesforce.

</details>

---

<details>
<summary>📤 Outbound (Salesforce → External)</summary>

**Definition:** Salesforce sends data/triggers to external systems.

**Methods:**
- Apex HTTP Callouts (REST/SOAP)
- Flow HTTP Callouts (no-code)
- Outbound Messages (SOAP, declarative)
- Platform Events / CDC
- Virtual (Salesforce Connect, External Objects)

**Security:** Named Credentials, OAuth 2.0, Basic Auth, Mutual TLS.

**Example:** Send lead data to marketing automation in real time.

</details>

---

**Extra:**  
Bidirectional = mix of inbound + outbound, with sync rules.  
Choose method based on **timing** (real-time/batch), **volume**, **maintenance**.

</details>
