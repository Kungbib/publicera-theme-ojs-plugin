<?php

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
		HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));
		// Load Vendor JS
		$this->addScript('bootstrap', 'js/bootstrap.min.js');
		$this->addScript('masonry', 'js/masonry.pkgd.min.js');
		// Load own JS
		$this->addScript('journal-list', 'js/journal-list.js');
		// Image assets
		HookRegistry::register('TemplateManager::display', array($this, 'sitewideData'));
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.publicera_theme.name');
	}

	function sitewideData($hookName, $args) {
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
	 * Fired when the `TemplateManager::display` hook is called.
	 *
	 * @param string $hookname
	 * @param array $args [$templateMgr, $template, $sendContentType, $charset, $output]
	 */
	public function loadTemplateData($hookName, $args) {

		// Retrieve the TemplateManager
		$templateMgr = $args[0];

		// Attach a custom piece of data to the TemplateManager
		$myCustomData = 'This is my custom data. It could be any PHP variable.';
		$templateMgr->assign('myCustomData', $myCustomData);

		return false;
	}

}

?>
