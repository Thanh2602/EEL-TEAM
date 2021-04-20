# **TỔNG QUAN**
  - ZFNet là một mạng nơ-ron tích tụ cổ điển. Thiết kế được thúc đẩy bằng cách hình dung (visualizing) các lớp tính năng trung gian và hoạt động của bộ phân loại. So với AlexNet, kích thước bộ lọc được giảm xuống và giảm độ lệch của các vòng xoắn(the stride of the convolutions).
![image](https://user-images.githubusercontent.com/80802875/115350581-7b19cf00-a1df-11eb-96b6-934ea7df2c8c.png)

 Giải thích: - kiến trúc của chập 8 lớp. Hình ảnh cắt 224 x 224 được làm đầu vào. Điều này được kết hợp với 96 bộ lọc lớp thứ nhất khác nhau (màu đỏ), mỗi bộ có kích thước 7 x 7, sử dụng sải chân là 2 ở cả x và y. Các bản đồ đặc trưng thu được sau đó: (i) được chuyển qua một hàm tuyến tính(ReLUs) được chỉnh lưu (không được hiển thị). (ii) gộp chung (tối đa trong vùng 3x3, sử dụng bước 2) và (iii) chuẩn hóa liên tục giữa các bản đồ đối tượng để tạo ra 96 bản đồ đối tượng có 55 x 55 khác nhau. Các thao tác tương tự được lặp lại ở các lớp 2,3,4,5. Hai lớp cuối cùng được kết nối đầy đủ, lấy các tính năng từ lớp chập trên cùng làm đầu vào ở dạng vectơ (kích thước 6x6x256 = 9216). Lớp cuối cùng là một hàm softmax C-way, C là số lớp. Tất cả các bộ lọc và bản đồ đối tượng đều có hình vuông

# **GIỚI THIỆU THÀNH PHẦN**

## CONVOLUTION (Tích Chập):
  - Phép chập là một loại phép toán ma trận, bao gồm một kernel, một ma trận nhỏ có trọng số, trượt qua dữ liệu đầu vào, thực hiện phép nhân khôn ngoan phần tử với phần đầu vào mà nó đang ở trên, sau đó tổng hợp các kết quả thành một đầu ra.
  - Về mặt trực quan, một phép tích chập cho phép chia sẻ trọng số - giảm số lượng các tham số hiệu quả - và dịch hình ảnh (cho phép phát hiện cùng một tính năng trong các phần khác nhau của không gian đầu vào).
![image](https://user-images.githubusercontent.com/80802875/115276017-baf39e80-a16c-11eb-8c6e-3ea8792c6595.png)

## DENSE CONNECTIONS or FULLY CONNECTED CONNECTIONS
   (kết nối dày đặc) và (kết nối đầy đủ)
   - Kết nối dày đặc, hoặc Kết nối được kết nối đầy đủ, là một loại lớp trong mạng nơ-ron sâu sử dụng hoạt động tuyến tính trong đó mọi đầu vào được kết nối với mọi đầu ra theo trọng số. Điều này có nghĩa là có ![image](https://user-images.githubusercontent.com/80802875/115280503-3441c000-a172-11eb-8427-6bb88e343a2b.png) tham số, có thể dẫn đến rất nhiều tham số cho một mạng lớn.
   - ![image](https://user-images.githubusercontent.com/80802875/115280654-5b988d00-a172-11eb-8a53-3d906b5b79b7.png)
   g: hàm kích hoạt.
![image](https://user-images.githubusercontent.com/80802875/115280815-8be02b80-a172-11eb-8f20-51f146c5eb34.png)

## DROP OUT (Loại bỏ)
   - Drop out là một kỹ thuật chính quy hoá cho các mạng thần kinh làm rơi một đơn vị (cùng với các kết nối) tại thời điểm đào tạo với một xác suất được chỉ định ![image](https://user-images.githubusercontent.com/80802875/115281219-f5603a00-a172-11eb-8cbf-cda6dc8c0b15.png) (giá trị chung ![image](https://user-images.githubusercontent.com/80802875/115281348-19bc1680-a173-11eb-8e61-240ae5760f6a.png)). Tại thời điểm kiểm tra, tất cả các đơn vị đều có mặt, nhưng với trọng số(weights) được chia tỷ lệ bởi ![image](https://user-images.githubusercontent.com/80802875/115281519-4bcd7880-a173-11eb-855f-7f9562d6d632.png)(![image](https://user-images.githubusercontent.com/80802875/115281586-6142a280-a173-11eb-828b-df8384835143.png) trở thành ![image](https://user-images.githubusercontent.com/80802875/115281650-6ef82800-a173-11eb-9689-77313194e537.png) )
   - Ý tưởng là để ngăn chặn sự đồng thích ứng, trong đó neural network trở nên quá phụ thuộc vào các kết nối cụ thể, vì điều này có thể là triệu chứng của việc trang bị quá mức. Về mặt trực giác, việc loại bỏ có thể được coi là tạo ra một quần thể mạng neural tiềm ẩn.
![image](https://user-images.githubusercontent.com/80802875/115282047-eaf27000-a173-11eb-9beb-0f163080102e.png)

## LOCAL CONSTRAST NORMALIZATION (Chuẩn hoá độ tương phản cục bộ)
   - Chuẩn hóa tương phản cục bộ là một loại chuẩn hóa thực hiện chuẩn hóa phép trừ và chia cục bộ, thực thi một loại cạnh tranh cục bộ giữa các đối tượng địa lý liền kề trong bản đồ đối tượng địa lý và giữa các đối tượng địa lý tại cùng một vị trí không gian trong các bản đồ đối tượng địa lý khác nhau.
![image](https://user-images.githubusercontent.com/80802875/115282550-884da400-a174-11eb-83f4-457e704c422f.png)

## MAX POOLING
   - Max pooling là một hoạt động tổng hợp tính toán giá trị tối đa cho các bản vá lỗi của bản đồ đối tượng (feature map) và sử dụng nó để tạo bản đồ đối tượng địa lý được lấy mẫu xuống(tổng hợp). Nó thường được sử dụng sau một lớp phức hợp. Nó bổ sung một lượng nhỏ bất biến dịch - nghĩa là dịch hình ảnh theo một lượng nhỏ không ảnh hưởng đáng kể đến giá trị của hầu hết các đầu ra được gộp chung.
![image](https://user-images.githubusercontent.com/80802875/115283418-86d0ab80-a175-11eb-8c01-a29ecd80d16b.png)

## RECTIFIED LINEAR UNITS (ReLUs)
   - ReLUs, là một loại hàm kích hoạt tuyến tính theo chiều dương, nhưng bằng không trong chiều âm. Đường gấp khúc trong hàm là nguồn gốc của sự không tuyến tính. Độ tuyến tính trong chiều dương có đặc tính hấp dẫn là nó ngăn cản sự không bão hòa của gradient (tương phản với kích hoạt sigmoid (constract with sigmoid activations)), mặc dù đối với một nửa đường thực, gradient của nó bằng 0.
![image](https://user-images.githubusercontent.com/80802875/115283683-e4fd8e80-a175-11eb-81f9-c75582135ae7.png)

## SOFTMAX 
   -  Hàm Softmax output biến đầu ra của lớp trước thành vectơ xác suất. Nó thường được sử dụng để multiclass classification. Cho một vectơ đầu vào ![image](https://user-images.githubusercontent.com/80802875/115283982-4cb3d980-a176-11eb-9d64-2e25e264e1a3.png)
 và một vectơ trọng số ![image](https://user-images.githubusercontent.com/80802875/115284011-54737e00-a176-11eb-882f-c4f90bd9bb35.png)
, chúng ta có:
![image](https://user-images.githubusercontent.com/80802875/115284046-5dfce600-a176-11eb-9030-2d74584b6a39.png)
