# Reflection — Lab 19

**Tên:** _Khưu Minh Toàn_
**Cohort:** _AI20K Cohort 2 2A202601011_
**Path đã chạy:** _Lite_ 

---

## Câu hỏi (≤ 200 chữ)

> Trên golden set 50 queries, mode nào thắng ở loại query nào (`exact` /
> `paraphrase` / `mixed`), và tại sao? Khi nào bạn **không** dùng hybrid
> (i.e. khi nào pure BM25 hoặc pure vector là lựa chọn đúng)?

_Answer here._
Trong bài lab này, tôi đã hiểu rõ sức mạnh của Hybrid Search khi kết hợp linh hoạt giữa tìm kiếm từ khóa (BM25) và tìm kiếm ngữ nghĩa (Vector Embedding qua Qdrant). Thuật toán Reciprocal Rank Fusion (RRF) giúp cân bằng hai phương pháp này, mang lại độ chính xác (Precision@10) cao hơn đáng kể trong các truy vấn thực tế (mixed queries). Bên cạnh đó, việc bọc các chức năng này vào một API FastAPI cho tôi kinh nghiệm về việc đo đạc và tối ưu hiệu năng với ngưỡng độ trễ P99 khắt khe (< 50ms).

Ngoài ra, thông qua Feast Feature Store, tôi nhận thấy tầm quan trọng của việc duy trì tính nhất quán của đặc trưng (features) giữa pha huấn luyện offline (Parquet) và pha phục vụ online (SQLite/Redis). Cơ chế Point-in-Time (PIT) join của Feast là chìa khóa cực kỳ quan trọng giúp ngăn chặn rò rỉ dữ liệu tương lai (data leakage) vào dữ liệu huấn luyện, từ đó tránh được lỗi training-serving skew khi đưa mô hình vào Production.

---

## Điều ngạc nhiên nhất khi làm lab này

_(Optional, 1–2 câu)_

Khi thực hiện lab, tôi đặc biệt ngạc nhiên khi nhận thấy mặc dù chế độ Hybrid (kết hợp BM25 và Vector) đạt điểm P@10 cao nhất trên tập dữ liệu chung (59.86%), nhưng nó lại tỏ ra kém hiệu quả hơn so với chế độ Vector thuần (61.48%) đối với các truy vấn loại "paraphrase". Điều này cho thấy một thực tế thú vị trong hệ thống tìm kiếm: ngay cả khi kết hợp các phương pháp, việc tìm ra sự cân bằng tối ưu cho mọi trường hợp sử dụng vẫn là một thách thức. Ngoài ra, việc áp dụng Feast Feature Store cho thấy sự phức tạp trong quản lý dữ liệu huấn luyện so với dự đoán ban đầu.

---

## Bonus challenge

- [ ] Đã làm bonus (xem `bonus/`)
- [ ] Pair work với: _<tên đồng đội nếu có>_
