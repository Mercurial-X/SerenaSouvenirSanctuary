# Serena Souvenir Sanctuary

An interactive and dynamic e-commerce website built using **ASP.NET Web Forms** with **SQL Server Express** database integration.  
This project is developed as part of the *Internet Applications* 

---

## 📌 Project Objective

To build an interactive, browser-compatible online ordering system that:
- Uses ASP.NET Web Forms and SQL Server.
- Demonstrates user authentication, product browsing, cart management, and admin dashboard functionality.
- Uses standard HTML, CSS, JavaScript, and ASP.NET server controls.

---

## 🌐 Browser Compatibility

Tested on:
- ✅ Google Chrome
- ✅ Mozilla Firefox
- ✅ Microsoft Edge
- ✅ Opera
- ✅ Internet Explorer 11

---

## 🔧 Setup Instructions

1. Clone or download this repo.
2. Open `SerenaSouvenirSanctuary.sln` in **Visual Studio**.
3. Make sure **SQL Server Express** is installed.
4. Ensure `App_Data/SerenaDB.mdf` is not locked or already attached in SQL Server.
5. Build the solution and run (`Ctrl + F5`).

---

## 🗂 Folder Structure

/App_Data → SQL Server MDF database (attached with connection string)
/Img → Product images
/AdminDashboard.aspx → Admin control panel
/ProductList.aspx → Product listing
/Cart.aspx → Shopping cart
/Checkout.aspx → Simulated checkout process
/Feedback.aspx → Visitor feedback form
/Home.aspx → Main landing page
/web.config → Contains AttachDBFilename connection string
/README.md → This file


---

## 👥 User Roles & Credentials

### 🔐 Admin Account
- **Username:** `admin`
- **Password:** `admin123`

> You may find additional test accounts in the `SerenaDB.mdf` file under `Members` table.

---

## ✅ Features Implemented

- Member registration and login (Forms Authentication)
- Admin-only panel with GridView and database maintenance
- Member-only pages for:
  - Cart management
  - Checkout
  - Profile updates
- Product display using:
  - `Repeater`
  - `GridView`
  - `DataList`
- Data binding and SQL connectivity
- Form validation (RequiredFieldValidator, RegexValidator)
- Proper folder structure, file naming, and master page usage
- `AttachDBFilename` used in `web.config` for easy database setup

---

## 💬 Feedback Form

Visitors can leave comments and suggestions via the **Feedback.aspx** page.

---

## ⚠️ Notes

- No real payment gateway integration — simulated only.
- Database is expected to be attached automatically via `App_Data/SerenaDB.mdf`.
- Ensure the `.mdf` file is not locked by SQL Server Management Studio before launching.

---

## 📄 Assignment Reference

This project fulfills the **20 assignment criteria** given under the CT069-3-M-IA Internet Applications module, including:
- 10+ web pages
- Admin/member authentication
- Data binding and controls
- Browser compatibility
- ReadMe documentation (this file)

---

## 🧑‍💻 Author

- **Name:** *Merc*
- **Course:** Internet Applications (CT069-3-M-IA)
- **University:** Asia Pacific University of Technology & Innovation

---

## 📅 Last Updated

**August 2025**
