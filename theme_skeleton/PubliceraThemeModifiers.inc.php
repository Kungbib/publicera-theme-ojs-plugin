<?php

class PubliceraThemeModifiers {

	public function __construct($_smarty) {
		$this->smarty = $_smarty;
	}

	/**
	 * sort_journals_desc
	 * Sorts journals array by getLocalizedName desc (a->z)
	 */
	public function sort_journals_desc($journals) {
		usort($journals, function($a, $b) {
			return strcmp($a->getLocalizedName(), $b->getLocalizedName());
		});

		return $journals;
	}

	/**
	 * sort_journals_asc
	 * Sorts journals array by getLocalizedName asc (z->a)
	 */
	public function sort_journals_asc($journals) {
		usort($journals, function($a, $b) {
			return strcmp($b->getLocalizedName(), $a->getLocalizedName());
		});

		return $journals;
	}

	/**
	 * filter_ps_journal
	 * Removes journal entry with path "ps" using getPath
	 */
	public function filter_ps_journal($journals) {
		$result = array();

		foreach($journals as $journal) {
			if ($journal->getPath() !== 'ps') {
				array_push($result, $journal);
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

}

?>
