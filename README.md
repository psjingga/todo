# 📝 To-Do List App  
A clean and simple task management application built with **Flutter + GetX**, supporting API-based To-Do data, status filtering, and task updates.

---

![GitHub License](https://img.shields.io/badge/license-MIT-green)
![GitHub Stars](https://img.shields.io/github/stars/your-username/your-repo-name?style=social)
![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue)
![GetX](https://img.shields.io/badge/GetX-State%20Management-purple)

---

## 📚 Table of Contents
- [📌 Deskripsi](#-deskripsi)
- [✨ Fitur Utama](#-fitur-utama)
- [🧩 Teknologi](#-teknologi)
- [📦 API Endpoint](#-api-endpoint)
- [📱 Preview UI](#-preview-ui)
- [🚀 Cara Menjalankan](#-cara-menjalankan)
- [📁 Struktur Folder](#-struktur-folder)
- [🔧 Arsitektur](#-arsitektur)
- [📄 Lisensi](#-lisensi)

---

## 📌 Deskripsi
**To-Do List App** adalah aplikasi manajemen tugas dengan fitur lengkap:
- Menampilkan data To-Do dari API
- Mengubah status tugas (To Do → In Progress → Done)
- Filter tugas berdasarkan status
- Tampilan UI yang modern & responsif
- Menggunakan arsitektur GetX: Controller, Service, View terpisah

Aplikasi ini cocok sebagai contoh integrasi **REST API + GetX** di Flutter.

---

## ✨ Fitur Utama
### ✔ Manage To-Do List
- Ambil data dari API
- Tampilkan To-Do berdasarkan filter:
  - **To Do**
  - **In Progress**
  - **Done**

### ✔ Update Status (PUT / PATCH)
Tugas dapat diubah statusnya menggunakan API.

### ✔ Real-Time UI Update
State otomatis berubah dengan GetX reactive.

### ✔ Dialog Konfirmasi
Saat mengubah status, muncul dialog:

> “Yakin ingin menyelesaikan tugas ini?”

### ✔ Notifikasi Berhasil
Saat tugas selesai → munculkan notifikasi sukses.

---

## 🧩 Teknologi
| Teknologi | Fungsi |
|----------|--------|
| Flutter  | Frontend |
| GetX     | State, Route, Dialog |
| HTTP     | Koneksi API |
| DummyJSON API | Data To-Do sample |

---

## 📦 API Endpoint
Menggunakan API:  
`https://dummyjson.com/todos`

### 🔹 Get All Todos
