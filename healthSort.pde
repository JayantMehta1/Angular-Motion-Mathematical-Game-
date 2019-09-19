void calc(ArrayList<Integer>nums) {
  int temp;
  for (int i = 1; i<nums.size(); i++) {
    for (int j = i-1; j>=0; j--) {
      if (nums.get(i) < nums.get(j)) {
        temp = nums.get(j);
        nums.set(j, nums.get(i));
        nums.set(i, temp);
        i--;
      } else {

        break;
      }
    }
  }
}
