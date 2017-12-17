package cn.jeeweb.core.tags.html;

@SuppressWarnings("serial")
public class FragmentComponentTag extends AbstractHtmlTag {
	private static final String[] SUPPORT_TYPES = { "FRAGMENT" };

	@Override
	public String[] getSupportTypes() {
		return SUPPORT_TYPES;
	}

}
