<?php

class PubliceraThemeModifiers {

	public function __construct($_smarty) {
		$this->smarty = $_smarty;
	}

	/**
	 * Limit the number of items in an array.
	 *
	 * @param array $array The array to limit.
	 * @param int $limit The maximum number of items.
	 * @return array The limited array.
	 */
	public static function limitItems($array, $limit) {
		return array_slice($array, 0, $limit);
	}

	/**
	 * Filter items that do not have the properties latestIssue or coverImage set.
	 *
	 * @param array $array The array to filter.
	 * @return array The filtered array.
	 */
	public static function itemsWithIssue($journals) {
		$result = array();

		foreach($journals as $journalData) {
			if (isset($journalData['latestIssueId']) && !empty($journalData['latestIssueId'])) {
				array_push($result, $journalData);
			}
		}

		return $result;
	}

	/**
	 * filter_ps_journal
	 * Removes journal entry with path "ps" using getPath
	 */
	public function filter_ps_journal($journals) {
		$result = array();

		foreach($journals as $journalData) {
			if ($journalData['journalUrl'] != 'ps' && $journalData['journalUrl'] != '/ps') {
				array_push($result, $journalData);
			}
		}

		return $result;
	}

	/**
	 * register
	 * Registers smarty plugin with type 'modifier' if plugin with the same name is not registered
	 */
	public function register($tag, $callback, $cacheable = true, $cache_attr = null) {
		if (!is_callable($callback)) {
			throw new SmartyException("Plugin \"{$tag}\" not callable");
		}

		if (!isset($this->smarty->registered_plugins['modifier'][$tag])) {
			$this->smarty->registered_plugins['modifier'][$tag] = array($callback, (bool) $cacheable, (array) $cache_attr);
		}

		return $this;
	}

	/**
	 * lowercase
	 * Converts string to lowercase
	 */
	public static function lowercase($string) {
		return mb_strtolower($string);
	}

	/**
	 * uppercase
	 * Converts string to uppercase
	 */
	public static function uppercase($string) {
		return mb_strtoupper($string);
	}
}

?>
