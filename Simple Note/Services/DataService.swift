class DataService {
  var data: Array<NoteData?> = [
    NoteData(id: 0, title: "First Note", text: "About Swift"),
    NoteData(id: 1, title: "Second Note", text: "About UIKit"),
    NoteData(
      id: 2,
      title: "Third Note",
      text: "ну ничего страшного пау пау пау пау пау пау пау пау"
    ),
  ]
  
  static var shared: DataService = {
    let instance = DataService()
    return instance
  }()
}
