// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// カロリー: %@kcal
  public static func labelCalories(_ p1: Any) -> String {
    return L10n.tr("Localizable", "label_calories", String(describing: p1), fallback: "カロリー: %@kcal")
  }
  /// カロリー (kcal)
  public static let labelCaloriesPlaceholder = L10n.tr("Localizable", "label_calories_placeholder", fallback: "カロリー (kcal)")
  /// キャンセル
  public static let labelCancel = L10n.tr("Localizable", "label_cancel", fallback: "キャンセル")
  /// カテゴリ
  public static let labelCategory = L10n.tr("Localizable", "label_category", fallback: "カテゴリ")
  /// Chat
  public static let labelChat = L10n.tr("Localizable", "label_chat", fallback: "Chat")
  /// トレーニング内容
  public static let labelContentTraining = L10n.tr("Localizable", "label_content_training", fallback: "トレーニング内容")
  /// 総摂取カロリー： %@kcal
  public static func labelDailyCalories(_ p1: Any) -> String {
    return L10n.tr("Localizable", "label_daily_calories", String(describing: p1), fallback: "総摂取カロリー： %@kcal")
  }
  /// 削除する
  public static let labelDelete = L10n.tr("Localizable", "label_delete", fallback: "削除する")
  /// 編集する
  public static let labelEdit = L10n.tr("Localizable", "label_edit", fallback: "編集する")
  /// 食事内容を入力
  public static let labelInputMealContent = L10n.tr("Localizable", "label_input_meal_content", fallback: "食事内容を入力")
  /// メニューを入力
  public static let labelInputMenu = L10n.tr("Localizable", "label_input_menu", fallback: "メニューを入力")
  /// 記録入力
  public static let labelInputRecord = L10n.tr("Localizable", "label_input_record", fallback: "記録入力")
  /// 食事
  public static let labelMeal = L10n.tr("Localizable", "label_meal", fallback: "食事")
  /// 食事内容: %@
  public static func labelMealContent(_ p1: Any) -> String {
    return L10n.tr("Localizable", "label_meal_content", String(describing: p1), fallback: "食事内容: %@")
  }
  /// 食事内容
  public static let labelMealContentTitle = L10n.tr("Localizable", "label_meal_content_title", fallback: "食事内容")
  /// メニュー: %@
  public static func labelMenu(_ p1: Any) -> String {
    return L10n.tr("Localizable", "label_menu", String(describing: p1), fallback: "メニュー: %@")
  }
  /// MyPage
  public static let labelMyPage = L10n.tr("Localizable", "label_my_page", fallback: "MyPage")
  /// Record
  public static let labelRecord = L10n.tr("Localizable", "label_record", fallback: "Record")
  /// RecordScreen
  public static let labelRecordScreen = L10n.tr("Localizable", "label_record_screen", fallback: "RecordScreen")
  /// 回数
  public static let labelReps = L10n.tr("Localizable", "label_reps", fallback: "回数")
  /// 保存
  public static let labelSave = L10n.tr("Localizable", "label_save", fallback: "保存")
  /// カテゴリを選択
  public static let labelSelectCategory = L10n.tr("Localizable", "label_select_category", fallback: "カテゴリを選択")
  /// Timeline
  public static let labelTimeline = L10n.tr("Localizable", "label_timeline", fallback: "Timeline")
  /// トレーニング
  public static let labelTraining = L10n.tr("Localizable", "label_training", fallback: "トレーニング")
  /// 重量 (kg)
  public static let labelWeight = L10n.tr("Localizable", "label_weight", fallback: "重量 (kg)")
  /// 重量: %@  レップ: %@
  public static func labelWeightAndReps(_ p1: Any, _ p2: Any) -> String {
    return L10n.tr("Localizable", "label_weight_and_reps", String(describing: p1), String(describing: p2), fallback: "重量: %@  レップ: %@")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
