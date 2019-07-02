# 선택정렬(selection sort)
def selection_sort(a,n)
   for i in 0...n
      min=i
      for j in (i+1)...n
         if a[j]<a[min]
            min = j
         end
      end
      if i!=min
         temp=a[i]
         a[i]=a[min]
         a[min]=temp
      end
   end
   puts "selection sort completed"
   puts a
end

# 버블정렬(bubble sort)
def bubble_sort(a,n)
   sorted=false
   while(!sorted)
      sorted=true
      for i in 1...n
         if a[i-1]>a[i]
            temp=a[i-1]
            a[i-1]=a[i]
            a[i]=temp
            sorted = false
         end
      end
   end
   puts "bubble sort completed"
   puts a
end

# 삽입정렬(insertion sort)
def insertion_sort(a,n)
   i = 0
   while i < n
      temp = a[i]
      j = i
      while j > 0 && a[j - 1] > temp
         a[j] = a[j - 1]
         j -= 1
      end
   a[j] = temp
   i += 1
   end
   puts "insertion sort completed"
   puts a
end

# 쉘정렬(shell sort)
def shell_sort(a, n)
   gap = n/2
   while gap>0
      for i in (gap...n)
         temp=a[i]
         j=i
         while j>=gap and a[j-gap]>temp
            a[j]=a[j-gap]
            j-=gap
         end
         a[j]=temp
      end
      gap /= 2
   end
   puts "shell sort completed"
   puts a
end

# 퀵정렬(quick sort)
def quick_sort(a,left,right)
   if left<right
      p=partition(a,left,right)
      quick_sort(a,left,p-1)
      quick_sort(a,p+1,right)
   end
   puts "implementing quick sort"
   puts a
end

def partition(a,left,right)
   i=left
   j=right+1
   pivot= a[left]
   while true
      begin
         i+=1
         break if i==right
      end while a[i]<pivot
      begin 
         j-=1
         break if j==left
      end while a[j]>pivot   
      break if i>=j
      temp=a[i]
      a[i]=a[j]
      a[j]=temp
   end
   temp=a[left]
   a[left]=a[j]
   a[j]=temp
   return j
end

# 합병정렬(merge sort)
def merge(a,l,m,r)
	#1. 오른쪽 왼쪽 임시배열 만들고 값 할당하기 
    n1 = m-l+1
    left = Array.new(n1) 
    n2 = r-m
    right = Array.new(n2) 
    
    for i in 0...n1         
        left[i]= a[l+i]
    end
    
    for i in 0...n2         
        right[i]= a[m+1+i]
    end
    
    i=0
    j=0
    
    #2. 오른쪽배열 왼쪽배열 비교해서 합병하기
    for k in l..r
        if i>=n1   # 왼쪽배열 다 쓴 경우->오른쪽배열삽입
            a[k]=right[j]
            j+=1
        elsif j>=n2   # 오른쪽배열 다 쓴 경우->왼쪽배열삽입
            a[k]=left[i]
            i+=1
        elsif left[i]>right[j]   # 오른쪽배열이 더 작은 경우->오른쪽배열삽입
            a[k]=right[j]
            j+=1
        else   # 왼쪽배열이 더 작은 경우->왼쪽배열삽입
            a[k]=left[i]
            i+=1
        end
    end
 end

def merge_sort(a,left,right)
   if left<right
      mid=(left+right)/2
      merge_sort(a,left,mid)
      merge_sort(a,mid+1,right)
      merge(a,left,mid,right)
   end
   puts "implementing merge sort"
   puts a
end	   
	 
	   
# 힙정렬(heap sort)
def heap_sort(array, n)   
  a = [nil] + array             # 루트노드 인덱스 1로바꿈
	#리프노드는 이미 힙상태이므로 n/2인덱스부터 1번인덱스까지 힙만들기
  (n / 2).downto(1) do |i|  
    heapify(a, i, n)  
  end  
  while n > 1  
    a[1], a[n] = a[n], a[1]  
    n -= 1  
    heapify(a, 1, n)  
  end  
  a.drop(1)                     # 루트노드 인덱스 다시0으로 
end  
  
def heapify(a, parent, limit)  
  wk = a[parent]  
  while (child = 2 * parent) <= limit  # 자식노드의 인덱스는 부모노드*2
    child += 1  if child < limit and a[child] < a[child + 1]  
    break  if wk >= a[child]  
    a[parent] = a[child]  
    parent = child  
  end  
  a[parent] = wk  
end  	   
	   
# 숫자배열 랜덤생성
a = (1..10).to_a.shuffle
n = a.size

puts "shuffled array"
puts a

#7가지 정렬함수 호출
#selection_sort(a,n)
#bubble_sort(a,n)
#insertion_sort(a,n)
#shell_sort(a,n)
#quick_sort(a,0,n-1)
#merge_sort(a,0,n-1)
#p heap_sort(a,n)