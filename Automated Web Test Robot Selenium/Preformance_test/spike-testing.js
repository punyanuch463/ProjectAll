import http from "k6/http";
import { sleep } from "k6";

export const options = {
  
    stages: [
      { duration: '2m', target: 2000 }, // ต้องเร็วเเละจำนวนเยอะมากๆ 2 นาทีมี user เข้าใช้ 2000 คน
      { duration: '1m', target: 0 }, // เเละลดลงเหลือ 0 คนภายใน 1 นาที
    ],
  };
  
export default function () {
    http.get("http://45.144.164.182:8081/");
//   sleep(1)
}