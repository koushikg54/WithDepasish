//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `SWRevealViewController`, and contains static references to 2 segues.
    struct swRevealViewController {
      /// Segue identifier `sw_front`.
      static let sw_front: Rswift.StoryboardSegueIdentifier<SWRevealViewControllerSegueSetController, SWRevealViewController, UIKit.UINavigationController> = Rswift.StoryboardSegueIdentifier(identifier: "sw_front")
      /// Segue identifier `sw_rear`.
      static let sw_rear: Rswift.StoryboardSegueIdentifier<SWRevealViewControllerSegueSetController, SWRevealViewController, MenuViewController> = Rswift.StoryboardSegueIdentifier(identifier: "sw_rear")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `sw_front`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func sw_front(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<SWRevealViewControllerSegueSetController, SWRevealViewController, UIKit.UINavigationController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.swRevealViewController.sw_front, segue: segue)
      }
      #endif

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `sw_rear`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func sw_rear(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<SWRevealViewControllerSegueSetController, SWRevealViewController, MenuViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.swRevealViewController.sw_rear, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `Dashboard`.
    static let dashboard = _R.storyboard.dashboard()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Dashboard", bundle: ...)`
    static func dashboard(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.dashboard)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 4 files.
  struct file {
    /// Resource file `1024x768.png`.
    static let x768Png = Rswift.FileResource(bundle: R.hostingBundle, name: "1024x768", pathExtension: "png")
    /// Resource file `1792x828_landscape.png`.
    static let x828_landscapePng = Rswift.FileResource(bundle: R.hostingBundle, name: "1792x828_landscape", pathExtension: "png")
    /// Resource file `2048x1536.png`.
    static let x1536Png = Rswift.FileResource(bundle: R.hostingBundle, name: "2048x1536", pathExtension: "png")
    /// Resource file `768x1024.png`.
    static let x1024Png = Rswift.FileResource(bundle: R.hostingBundle, name: "768x1024", pathExtension: "png")

    /// `bundle.url(forResource: "1024x768", withExtension: "png")`
    static func x768Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.x768Png
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "1792x828_landscape", withExtension: "png")`
    static func x828_landscapePng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.x828_landscapePng
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "2048x1536", withExtension: "png")`
    static func x1536Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.x1536Png
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "768x1024", withExtension: "png")`
    static func x1024Png(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.x1024Png
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 23 images.
  struct image {
    /// Image `1024x768`.
    static let x768 = Rswift.ImageResource(bundle: R.hostingBundle, name: "1024x768")
    /// Image `2048x1536`.
    static let x1536 = Rswift.ImageResource(bundle: R.hostingBundle, name: "2048x1536")
    /// Image `24-hours`.
    static let hours = Rswift.ImageResource(bundle: R.hostingBundle, name: "24-hours")
    /// Image `768x1024`.
    static let x1024 = Rswift.ImageResource(bundle: R.hostingBundle, name: "768x1024")
    /// Image `Back`.
    static let back = Rswift.ImageResource(bundle: R.hostingBundle, name: "Back")
    /// Image `account`.
    static let account = Rswift.ImageResource(bundle: R.hostingBundle, name: "account")
    /// Image `add`.
    static let add = Rswift.ImageResource(bundle: R.hostingBundle, name: "add")
    /// Image `calendar`.
    static let calendar = Rswift.ImageResource(bundle: R.hostingBundle, name: "calendar")
    /// Image `cc`.
    static let cc = Rswift.ImageResource(bundle: R.hostingBundle, name: "cc")
    /// Image `circle`.
    static let circle = Rswift.ImageResource(bundle: R.hostingBundle, name: "circle")
    /// Image `doctr`.
    static let doctr = Rswift.ImageResource(bundle: R.hostingBundle, name: "doctr")
    /// Image `emr`.
    static let emr = Rswift.ImageResource(bundle: R.hostingBundle, name: "emr")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `med`.
    static let med = Rswift.ImageResource(bundle: R.hostingBundle, name: "med")
    /// Image `menu`.
    static let menu = Rswift.ImageResource(bundle: R.hostingBundle, name: "menu")
    /// Image `person`.
    static let person = Rswift.ImageResource(bundle: R.hostingBundle, name: "person")
    /// Image `pin`.
    static let pin = Rswift.ImageResource(bundle: R.hostingBundle, name: "pin")
    /// Image `profilePlaceHolder`.
    static let profilePlaceHolder = Rswift.ImageResource(bundle: R.hostingBundle, name: "profilePlaceHolder")
    /// Image `search`.
    static let search = Rswift.ImageResource(bundle: R.hostingBundle, name: "search")
    /// Image `splash`.
    static let splash = Rswift.ImageResource(bundle: R.hostingBundle, name: "splash")
    /// Image `test-tube`.
    static let testTube = Rswift.ImageResource(bundle: R.hostingBundle, name: "test-tube")
    /// Image `text-logo`.
    static let textLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "text-logo")
    /// Image `youtube`.
    static let youtube = Rswift.ImageResource(bundle: R.hostingBundle, name: "youtube")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "1024x768", bundle: ..., traitCollection: ...)`
    static func x768(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.x768, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "2048x1536", bundle: ..., traitCollection: ...)`
    static func x1536(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.x1536, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "24-hours", bundle: ..., traitCollection: ...)`
    static func hours(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.hours, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "768x1024", bundle: ..., traitCollection: ...)`
    static func x1024(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.x1024, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Back", bundle: ..., traitCollection: ...)`
    static func back(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.back, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "account", bundle: ..., traitCollection: ...)`
    static func account(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.account, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "add", bundle: ..., traitCollection: ...)`
    static func add(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.add, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "calendar", bundle: ..., traitCollection: ...)`
    static func calendar(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.calendar, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "cc", bundle: ..., traitCollection: ...)`
    static func cc(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.cc, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "circle", bundle: ..., traitCollection: ...)`
    static func circle(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circle, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "doctr", bundle: ..., traitCollection: ...)`
    static func doctr(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.doctr, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "emr", bundle: ..., traitCollection: ...)`
    static func emr(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.emr, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "med", bundle: ..., traitCollection: ...)`
    static func med(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.med, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "menu", bundle: ..., traitCollection: ...)`
    static func menu(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.menu, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "person", bundle: ..., traitCollection: ...)`
    static func person(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.person, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "pin", bundle: ..., traitCollection: ...)`
    static func pin(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.pin, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "profilePlaceHolder", bundle: ..., traitCollection: ...)`
    static func profilePlaceHolder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.profilePlaceHolder, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "search", bundle: ..., traitCollection: ...)`
    static func search(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.search, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "splash", bundle: ..., traitCollection: ...)`
    static func splash(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.splash, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "test-tube", bundle: ..., traitCollection: ...)`
    static func testTube(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.testTube, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "text-logo", bundle: ..., traitCollection: ...)`
    static func textLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.textLogo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "youtube", bundle: ..., traitCollection: ...)`
    static func youtube(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.youtube, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 7 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `DoctorListTableViewCell`.
    static let doctorListTableViewCell: Rswift.ReuseIdentifier<DoctorListTableViewCell> = Rswift.ReuseIdentifier(identifier: "DoctorListTableViewCell")
    /// Reuse identifier `EmergencyHospTableViewCell`.
    static let emergencyHospTableViewCell: Rswift.ReuseIdentifier<EmergencyHospTableViewCell> = Rswift.ReuseIdentifier(identifier: "EmergencyHospTableViewCell")
    /// Reuse identifier `MemberListTableViewCell`.
    static let memberListTableViewCell: Rswift.ReuseIdentifier<MemberListTableViewCell> = Rswift.ReuseIdentifier(identifier: "MemberListTableViewCell")
    /// Reuse identifier `MenueTableViewCell`.
    static let menueTableViewCell: Rswift.ReuseIdentifier<MenueTableViewCell> = Rswift.ReuseIdentifier(identifier: "MenueTableViewCell")
    /// Reuse identifier `SpecializationCollectionViewCell`.
    static let specializationCollectionViewCell: Rswift.ReuseIdentifier<SpecializationCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "SpecializationCollectionViewCell")
    /// Reuse identifier `TopRatedDrCollectionViewCell`.
    static let topRatedDrCollectionViewCell: Rswift.ReuseIdentifier<TopRatedDrCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "TopRatedDrCollectionViewCell")
    /// Reuse identifier `UpConsultationTableViewCell`.
    static let upConsultationTableViewCell: Rswift.ReuseIdentifier<UpConsultationTableViewCell> = Rswift.ReuseIdentifier(identifier: "UpConsultationTableViewCell")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try dashboard.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct dashboard: Rswift.StoryboardResourceType, Rswift.Validatable {
      let addNewMbListViewController = StoryboardViewControllerResource<AddNewMbListViewController>(identifier: "AddNewMbListViewController")
      let bookAppointmentViewController = StoryboardViewControllerResource<BookAppointmentViewController>(identifier: "BookAppointmentViewController")
      let bundle = R.hostingBundle
      let dashboardTableViewController = StoryboardViewControllerResource<DashboardTableViewController>(identifier: "DashboardTableViewController")
      let doctorListViewController = StoryboardViewControllerResource<DoctorListViewController>(identifier: "DoctorListViewController")
      let drProfileTableViewController = StoryboardViewControllerResource<DrProfileTableViewController>(identifier: "DrProfileTableViewController")
      let emergencyHospViewController = StoryboardViewControllerResource<EmergencyHospViewController>(identifier: "EmergencyHospViewController")
      let memberListViewController = StoryboardViewControllerResource<MemberListViewController>(identifier: "MemberListViewController")
      let menuViewController = StoryboardViewControllerResource<MenuViewController>(identifier: "MenuViewController")
      let name = "Dashboard"
      let swRevealViewController = StoryboardViewControllerResource<SWRevealViewController>(identifier: "SWRevealViewController")
      let userProfileViewController = StoryboardViewControllerResource<UserProfileViewController>(identifier: "UserProfileViewController")

      func addNewMbListViewController(_: Void = ()) -> AddNewMbListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: addNewMbListViewController)
      }

      func bookAppointmentViewController(_: Void = ()) -> BookAppointmentViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: bookAppointmentViewController)
      }

      func dashboardTableViewController(_: Void = ()) -> DashboardTableViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: dashboardTableViewController)
      }

      func doctorListViewController(_: Void = ()) -> DoctorListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: doctorListViewController)
      }

      func drProfileTableViewController(_: Void = ()) -> DrProfileTableViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: drProfileTableViewController)
      }

      func emergencyHospViewController(_: Void = ()) -> EmergencyHospViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: emergencyHospViewController)
      }

      func memberListViewController(_: Void = ()) -> MemberListViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: memberListViewController)
      }

      func menuViewController(_: Void = ()) -> MenuViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: menuViewController)
      }

      func swRevealViewController(_: Void = ()) -> SWRevealViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: swRevealViewController)
      }

      func userProfileViewController(_: Void = ()) -> UserProfileViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: userProfileViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "24-hours", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named '24-hours' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "account", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'account' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "add", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'add' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "calendar", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'calendar' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "cc", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'cc' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "circle", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'circle' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "doctr", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'doctr' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "emr", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'emr' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "med", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'med' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "menu", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'menu' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "test-tube", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'test-tube' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if UIKit.UIImage(named: "youtube", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'youtube' is used in storyboard 'Dashboard', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.dashboard().addNewMbListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'addNewMbListViewController' could not be loaded from storyboard 'Dashboard' as 'AddNewMbListViewController'.") }
        if _R.storyboard.dashboard().bookAppointmentViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'bookAppointmentViewController' could not be loaded from storyboard 'Dashboard' as 'BookAppointmentViewController'.") }
        if _R.storyboard.dashboard().dashboardTableViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'dashboardTableViewController' could not be loaded from storyboard 'Dashboard' as 'DashboardTableViewController'.") }
        if _R.storyboard.dashboard().doctorListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'doctorListViewController' could not be loaded from storyboard 'Dashboard' as 'DoctorListViewController'.") }
        if _R.storyboard.dashboard().drProfileTableViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'drProfileTableViewController' could not be loaded from storyboard 'Dashboard' as 'DrProfileTableViewController'.") }
        if _R.storyboard.dashboard().emergencyHospViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'emergencyHospViewController' could not be loaded from storyboard 'Dashboard' as 'EmergencyHospViewController'.") }
        if _R.storyboard.dashboard().memberListViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'memberListViewController' could not be loaded from storyboard 'Dashboard' as 'MemberListViewController'.") }
        if _R.storyboard.dashboard().menuViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'menuViewController' could not be loaded from storyboard 'Dashboard' as 'MenuViewController'.") }
        if _R.storyboard.dashboard().swRevealViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'swRevealViewController' could not be loaded from storyboard 'Dashboard' as 'SWRevealViewController'.") }
        if _R.storyboard.dashboard().userProfileViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'userProfileViewController' could not be loaded from storyboard 'Dashboard' as 'UserProfileViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if UIKit.UIImage(named: "splash", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'splash' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = LoginViewController

      let bundle = R.hostingBundle
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Main"

      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "text-logo", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'text-logo' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
