<details>
    <summary> Declarative vs programmatic </summary>

    ## **1️⃣ The Core Difference**

    | **Aspect**     | **Declarative Development**                                                    | **Programmatic Development**                                            |
    | -------------- | ------------------------------------------------------------------------------ | ----------------------------------------------------------------------- |
    | **Definition** | Point-and-click configuration using Salesforce’s built-in tools, without code. | Writing custom code (Apex, LWC, Aura, etc.) to implement functionality. |
    | **Tools**      | - Flow Builder                                                                 |                                                                         |

    * Process Builder (legacy)
    * Approval Processes
    * Validation Rules
    * Page Layouts & Lightning App Builder | - Apex Classes & Triggers
    * Lightning Web Components (LWC)
    * Visualforce Pages
    * SOQL/SOSL Queries |
    \| **Complexity Handling** | Best for **simple to moderately complex** requirements that Salesforce can handle natively. | Best for **complex, highly customized** requirements that go beyond declarative capabilities. |
    \| **Maintenance** | Easier to maintain (less risk, no code refactoring needed). | Requires code maintenance, testing, deployments. |
    \| **Performance** | Optimized by Salesforce internally. | Developer must ensure performance & scalability. |

    ---

    ## **2️⃣ How to Decide — Declarative vs. Programmatic**

    Think of it as **"Start Declarative, Go Programmatic if Needed"**.
    Here’s a decision framework:

    1. **Check if Salesforce already supports it declaratively**

    * If yes → Use declarative (faster, cheaper, less maintenance).
    * Example: Auto-assign a task when Opportunity Stage = “Closed Won” → Use Flow.

    2. **Check complexity & flexibility needs**

    * If business logic needs **loops, recursion, complex data manipulation, cross-object updates not possible in Flow**, etc. → Use Apex.

    3. **Check performance & limits**

    * Declarative tools have **limits** (Flow element limits, entry criteria, governor limits).
    * If you’ll hit these limits → Apex might be necessary.

    4. **Check maintainability & team skillset**

    * If admins will maintain it → Keep it declarative.
    * If developers will maintain it → Code is fine.

    ---

    ## **3️⃣ Common Examples**

    | **Requirement**                                    | **Preferred Approach**         | **Why**                                     |
    | -------------------------------------------------- | ------------------------------ | ------------------------------------------- |
    | Send an email when a Case is closed                | Declarative (Flow)             | Simple, no custom logic                     |
    | Auto-update related records with complex filtering | Apex Trigger                   | Complex queries & multiple object updates   |
    | Create a custom UI for data entry                  | LWC                            | Need interactive, dynamic UI                |
    | Approval Process for expense reports               | Declarative (Approval Process) | Built-in, less effort                       |
    | Integration with an external payment gateway       | Apex                           | Requires HTTP callouts & handling responses |

    ---

    ## **4️⃣ How to Answer in an Interview**

    Here’s a **concise but confident** answer format:

    > **"Declarative development in Salesforce uses point-and-click tools like Flow, Validation Rules, and Approval Processes, which are faster to build and easier to maintain for simpler requirements. Programmatic development involves writing custom code in Apex, LWC, or Visualforce to handle complex logic, integrations, or UI needs that can't be met declaratively.
    > I usually start with a declarative approach to leverage Salesforce’s native capabilities, and only move to programmatic when the requirement exceeds what’s possible declaratively — for example, when we need complex data processing, API integrations, or custom UI components. This approach keeps solutions maintainable, cost-effective, and aligned with Salesforce best practices."**

    ---

    ✅ **Pro Tip for Interviews:**
    If asked **"When to choose which?"**, say:

    * **Declarative first**, unless there’s a **clear technical or business reason** to go programmatic.
    * Mention **governor limits, maintainability, and complexity** as your decision factors.
</details>