# SwiftImagePickerDemo
### 11月19日练习
* 调用系统的相机和相册，模拟应用中用户更改头像的操作。使用 UIImagePickerControllerDelegate 和 UINavigationControllerDelegate 这两个代理，并调用完成图片选择的代理方法实现头像更改：
```
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
```
