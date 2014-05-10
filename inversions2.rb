def merge_and_count(arr1, arr2, inv_num = 0)
	result = []
	i = 0
	j = 0
	num = 0
	until i == arr1.length || j == arr2.length
		if arr1[i] <= arr2[j]
			result << arr1[i]
			i += 1
		else
			result << arr2[j]
			j += 1
			num += arr1.length - i
		end
	end

	if i == arr1.length
		result += arr2[j..-1]
	else
		result += arr1[i..-1]
	end
	num += inv_num
	return result, num
end

def mergesort(array)
	
	if array.length <= 1
		return array, 0
	else
		mid = array.length / 2
		left, left_inv = mergesort(array[0...mid])
		right, right_inv = mergesort(array[mid...array.length])
		total = left_inv + right_inv
		merge_and_count(left,right, total)
	end
end

# tests = [
#   [],
#   [1, 2, 3, 4],
#   [4, 3, 2, 1],
#   [2, 1],
#   [1, 2],
#   [3, 2, 1],
#   [2, 3, 1],
#   [5, 4, 3, 2, 1],
#   [5, 2, 4, 1, 3],
#   [-1, -2, -3]
# ]

# expected_inversions = [
#   0,
#   0,
#   6,
#   1,
#   0,
#   3,
#   2,
#   10,
#   7,
#   3
# ]

# tests.each_with_index do |arr, i|
#   p (mergesort(arr) == [arr.sort, expected_inversions[i]])
# end

# p mergesort([4,3,2,1])