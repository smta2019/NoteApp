//
//  Note.swift
//  NoteApp
//
//  Created by stma2019 on 2021/07/01.
//

import RealmSwift

class Note: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0
    
    // タイトル
    @objc dynamic var title = ""
    
    // 内容
    @objc dynamic var contents = ""
    
    // 作成・更新日時
    @objc dynamic var date = Date()

    
    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
    
}


