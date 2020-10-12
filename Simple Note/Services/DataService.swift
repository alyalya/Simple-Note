class DataService {
    let data: Array<NoteData?> = [
        NoteData(title: "First Note", text: "About Swift"),
        NoteData(title: "Second Note", text: "About UIKit"),
        NoteData(title: "Third Note", text: "About UIKit"),
    ]
    
    static var shared: DataService = {
        let instance = DataService()
        return instance
    }()
}
