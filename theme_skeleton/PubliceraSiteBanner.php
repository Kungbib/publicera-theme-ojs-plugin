<?php

/**
 * @class DefaultChildThemePlugin
 * @ingroup plugins_themes_default
 *
 * @brief Default theme
 */
import('lib.pkp.classes.plugins.ThemePlugin');

class SiteBanner {
	private $content = "";

	public function __construct(Type $var = null) {
		$this->content = $this->fetchBannerContent();
	}

	private function fetchBannerContent() {
		$filePath = $_SERVER['DOCUMENT_ROOT'] . '/banner.txt';
		if (file_exists($filePath)) {
			$contents = file_get_contents($filePath);
			return trim(nl2br($contents));
		} else {
			return "";
		}
	}

	public function getBannerContent() {
		return $this->content;
	}

	public function shouldDisplayBanner() {
		return !empty($this->content);
	}
}

?>