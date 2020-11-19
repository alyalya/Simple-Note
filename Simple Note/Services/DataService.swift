class DataService {
  var data: Array<NoteData?> = [
    NoteData(title: "First Note", text: "About Swift"),
    NoteData(title: "Second Note", text: "About UIKit"),
    NoteData(
      title: "Third Note",
      text: "ну ничего страшного пау пау пау пау пау пау пау пау ну ничего страшного пау пау пау пау пау пау пау пау"
    ),
  ]
  
  static var shared: DataService = {
    let instance = DataService()
    return instance
  }()
}
