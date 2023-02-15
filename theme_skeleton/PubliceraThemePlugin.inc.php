<?php

// Includes
include 'PubliceraThemeModifiers.inc.php';

/**
 * @class DefaultChildThemePlugin
 * @ingroup plugins_themes_default
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class PubliceraThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme's styles, scripts and hooks. This is only run for
	 * the currently active theme.
	 *
	 * @return null
	 */
	public function init() {
		$this->setParent('defaultthemeplugin');

		// Load primary stylesheet
		$this->addStyle('stylesheet', 'styles/theme.css');
		// Load Vendor JS
		$this->addScript('bootstrap', 'js/bootstrap.min.js');
		$this->addScript('masonry', 'js/masonry.pkgd.min.js');

		// Load own JS
		$this->addScript('journal-list', 'js/journal-list.js');
		$this->addScript('about-collapse', 'js/about-collapse.js');

		// Image assets
		HookRegistry::register('TemplateManager::display', array($this, 'sitewideData'));

		// Load modifiers
		$this->loadModifiers();
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.publicera_theme.name');
	}

	function sitewideData($hookName, $args) {
		$this->smarty = $args[0];
		$smarty = $args[0];

		$imagesAssetPath = $this->getRequest()->getBaseUrl() . DIRECTORY_SEPARATOR . $this->getTemplatePath() . DIRECTORY_SEPARATOR . "images" . DIRECTORY_SEPARATOR;
		$smarty->assign('imageAssetPath', $imagesAssetPath);
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.publicera_theme.description');
	}

	/**
	 * Load theme smarty modifiers
	 */
	public function loadModifiers() {
		// Retrieve the TemplateManager
		$smarty = TemplateManager::getManager($this->getRequest());

		// Create new instance of modifiers class
		$modifiers = new PubliceraThemeModifiers($smarty);

		// Register modifiers in smarty
		$modifiers->register('sort_journals_desc', array($modifiers, 'sort_journals_desc'));
		$modifiers->register('sort_journals_asc', array($modifiers, 'sort_journals_asc'));
		$modifiers->register('filter_ps_journal', array($modifiers, 'filter_ps_journal'));
	}

}

?>
