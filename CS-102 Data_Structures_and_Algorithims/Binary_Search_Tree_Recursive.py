def build_bst(my_list):
  if len(my_list) == 0:
    return 'No Child'
  middle_idx = len(my_list)//2
  middle_value = my_list[middle_idx]
  print('Middle index: ' + str(middle_idx))
  print('Middle value: ' + str(middle_value))
  tree_node = {"data": middle_value}
  tree_node["left_child"] = build_bst(my_list[ : middle_idx])
  tree_node["right_child"] = build_bst(my_list[middle_idx + 1 : ])
  return tree_node
