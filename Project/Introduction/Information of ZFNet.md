#**TỔNG QUAN**
  - ZFNet là một mạng nơ-ron tích tụ cổ điển. Thiết kế được thúc đẩy bằng cách hình dung (visualizing) các lớp tính năng trung gian và hoạt động của bộ phân loại. So với AlexNet, kích thước bộ lọc được giảm xuống và giảm độ lệch của các vòng xoắn(the stride of the convolutions).
  
  
#**GIỚI THIỆU THÀNH PHẦN**
  ##1. CONVOLUTION (Tích Chập):
  - Phép chập là một loại phép toán ma trận, bao gồm một kernel, một ma trận nhỏ có trọng số, trượt qua dữ liệu đầu vào, thực hiện phép nhân khôn ngoan phần tử với phần đầu vào mà nó đang ở trên, sau đó tổng hợp các kết quả thành một đầu ra.

  - Về mặt trực quan, một phép tích chập cho phép chia sẻ trọng số - giảm số lượng các tham số hiệu quả - và dịch hình ảnh (cho phép phát hiện cùng một tính năng trong các phần khác nhau của không gian đầu vào).
