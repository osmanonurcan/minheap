# minheap

Bu projenin konusu assembly diliyle Min Heap oluşturma, Min Heap’te arama ve Min Heap’te
sıralamadır.

- Bu projede Keil uVision4 IDE’si yardımıyla assembly diliyle Min Heap oluşturulmuştur.
  * Readwrite bölgesinde heapArray adında 6 elemanlı bir dizi oluşturulmuştur. Bu dizinin ilk
elemanı dizinin uzunluğunu tutacaktır.
  * Readonly bölgesinde list adında 6 elemanlı, sonu -1 ile biten bir dizi oluşturulmuştur.
- Oluşturulan altprogramlar:
  * findArraylenght: -1 sayısı gelen kadar dizi dolaşılır ve sayaç bir arttırılır.
  * buildHeap: list elemanları heapArray’e atılır. En sondaki parent elemanı i değişkenine atılır. İ
değişkeni 1’den küçük olana kadar minHeapify altprogramı çağırılır ve i 1 azaltılır.
  * minHeapify: i değişkeni 1’den küçük olana kadar, i indeksindeki parent elemanı çocuklarıyla
karşılaştırılır. Kendisinden küçük elemanı varsa kendisiyle yer değiştirilir. Sonrasında i indeksi
azaltılır.
