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
		// Load Bootstrap
		$this->addScript('bootstrap', 'vendor/bootstrap.min.js');
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.publicera_theme.name');
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
