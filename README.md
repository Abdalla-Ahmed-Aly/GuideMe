# Robert – Smart Tourism Application

Robert هو تطبيق سياحي ذكي يربط السياح بالمرشدين المحليين داخل مصر، ويقدّم تجربة سفر آمنة وممتعة مع ميزات متقدمة مثل متابعة الجولات، الأحداث، الأماكن التراثية، والتواصل الفوري مع المرشدين.

---

## 🧭 Features & Scenarios

### Phase 1: User Authentication & Roles
- تسجيل دخول آمن مع JWT.
- اختيار اللغة (عربي/إنجليزي).
- إدارة أدوار المستخدمين (سائح / مرشد / مسؤول).

### Phase 2: Guide Verification & Profile Management
- رفع المستندات والتحقق من الحسابات.
- إدارة حالة المرشد (Pending → Verified).

### Phase 3: Booking & Payment (كاش)
- حجز المرشد حسب التاريخ والمدة.
- الدفع كاش Offline عند لقاء المرشد.

### Phase 4: Rating & Feedback System
- تقييم المرشد بعد الجولة.
- تحديث التقييمات في بروفايل المرشد تلقائيًا.

### Phase 5: Event & Heritage Places
- المسؤول ينشئ Events والسياح يمكنهم Join فيها.
- عرض الأماكن التراثية (اسم، عنوان، صور وفيديو قصير).

### Phase 6: Admin Dashboard
- مراجعة الحسابات، الحجوزات، والإحصائيات.
- لوحة تحكم متكاملة على الويب.

### Phase 7: Notifications System
- إشعارات فورية للحجوزات والأحداث السياحية.
- تكامل مع Firebase Cloud Messaging (FCM).

### Phase 8: Interactive Map & Nearby Guides
- خرائط تفاعلية تظهر المرشدين القريبين.
- فلترة حسب اللغة، السعر، التقييم، ونوع الجولة.

### Phase 9: Chat & Communication (Real-time)
- دردشة نصية وصور وموقع حي بين السائح والمرشد.
- Real-time chat باستخدام Socket.io.

---

## ⚙️ Technical Stack

| الجزء | التكنولوجيا |
|-------|-------------|
| Frontend (Mobile App) | Flutter |
| Backend | Node.js (Express Framework) |
| Database | MongoDB |
| Authentication | JWT (JSON Web Token) |
| Real-time Features | Socket.io |
| Maps & Location | Google Maps API |
| Notifications | Firebase Cloud Messaging (FCM) |
| Admin Panel | React.js + Node.js APIs |
| Payments | كاش فقط (Offline) |

---

## 💡 Installation & Setup

1. Clone the repository:

```bash
git clone https://github.com/Abdalla-Ahmed-Aly/GuideMe.git
