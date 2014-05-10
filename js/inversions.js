var merge = function(arr1, arr2, inv_num) {
	var result = [];
	var i = j = num = 0;
	while (i < arr1.length && j < arr2.length) {
		if (arr1[i] <= arr2[j] ) {
			result.push(arr1[i]);
			i++;
		}
		else {
			result.push(arr2[j]);
			j++;
			num += arr1.length - i;
		}
	}
	if (i === arr1.length) {
		result = result.concat(arr2.slice(j));
	}
	else {
		result = result.concat(arr1.slice(i));
	}
	return[result, num + inv_num];
};

var mergeSort = function(array) {
	if (array.length <= 1) {
		return [array, 0];
	} else {
		var left = mergeSort(array.slice(0, array.length/2));
		var right = mergeSort(array.slice(array.length/2));
		return merge(left[0], right[0], left[1] + right[1]);
	}
};