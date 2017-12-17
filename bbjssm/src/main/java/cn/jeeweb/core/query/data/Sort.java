package cn.jeeweb.core.query.data;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import org.springframework.util.StringUtils;

public class Sort implements Iterable<cn.jeeweb.core.query.data.Sort.Order>, Serializable {

	private static final long serialVersionUID = 5737186511678863905L;
	public static final Direction DEFAULT_DIRECTION = Direction.ASC;

	private final List<Order> orders;

	/**
	 * Creates a new {@link Sort} instance using the given {@link Order}s.
	 * 
	 * @param orders
	 *            must not be {@literal null}.
	 */
	public Sort(Order... orders) {
		this(Arrays.asList(orders));
	}

	/**
	 * Creates a new {@link Sort} instance.
	 * 
	 * @param orders
	 *            must not be {@literal null} or contain {@literal null}.
	 */
	public Sort(List<Order> orders) {

		if (null == orders || orders.isEmpty()) {
			throw new IllegalArgumentException("You have to provide at least one sort property to sort by!");
		}

		this.orders = orders;
	}

	/**
	 * Creates a new {@link Sort} instance. Order defaults to
	 * {@value Direction#ASC}.
	 * 
	 * @param properties
	 *            must not be {@literal null} or contain {@literal null} or
	 *            empty strings
	 */
	public Sort(String... properties) {
		this(DEFAULT_DIRECTION, properties);
	}

	/**
	 * Creates a new {@link Sort} instance.
	 * 
	 * @param direction
	 *            defaults to {@linke Sort#DEFAULT_DIRECTION} (for
	 *            {@literal null} cases, too)
	 * @param properties
	 *            must not be {@literal null} or contain {@literal null} or
	 *            empty strings
	 */
	public Sort(Direction direction, String... properties) {
		this(direction, properties == null ? new ArrayList<String>() : Arrays.asList(properties));
	}

	/**
	 * Creates a new {@link Sort} instance.
	 * 
	 * @param direction
	 * @param properties
	 */
	public Sort(Direction direction, List<String> properties) {

		if (properties == null || properties.isEmpty()) {
			throw new IllegalArgumentException("You have to provide at least one property to sort by!");
		}

		this.orders = new ArrayList<Order>(properties.size());

		for (String property : properties) {
			this.orders.add(new Order(direction, property));
		}
	}

	/**
	 * Returns a new {@link Sort} consisting of the {@link Order}s of the
	 * current {@link Sort} combined with the given ones.
	 * 
	 * @param sort
	 *            can be {@literal null}.
	 * @return
	 */
	public Sort and(Sort sort) {

		if (sort == null) {
			return this;
		}

		ArrayList<Order> these = new ArrayList<Order>(this.orders);

		for (Order order : sort) {
			these.add(order);
		}

		return new Sort(these);
	}

	/**
	 * Returns the order registered for the given property.
	 * 
	 * @param property
	 * @return
	 */
	public Order getOrderFor(String property) {

		for (Order order : this) {
			if (order.getProperty().equals(property)) {
				return order;
			}
		}

		return null;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Iterable#iterator()
	 */
	public Iterator<Order> iterator() {
		return this.orders.iterator();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {

		if (this == obj) {
			return true;
		}

		if (!(obj instanceof Sort)) {
			return false;
		}

		Sort that = (Sort) obj;

		return this.orders.equals(that.orders);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {

		int result = 17;
		result = 31 * result + orders.hashCode();
		return result;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return StringUtils.collectionToCommaDelimitedString(orders);
	}

	/**
	 * Enumeration for sort directions.
	 * 
	 * @author Oliver Gierke
	 */
	public static enum Direction {

		ASC, DESC;

		/**
		 * Returns the {@link Direction} enum for the given {@link String}
		 * value.
		 * 
		 * @param value
		 * @throws IllegalArgumentException
		 *             in case the given value cannot be parsed into an enum
		 *             value.
		 * @return
		 */
		public static Direction fromString(String value) {

			try {
				return Direction.valueOf(value.toUpperCase(Locale.US));
			} catch (Exception e) {
				throw new IllegalArgumentException(String.format(
						"Invalid value '%s' for orders given! Has to be either 'desc' or 'asc' (case insensitive).",
						value), e);
			}
		}

		/**
		 * Returns the {@link Direction} enum for the given {@link String} or
		 * null if it cannot be parsed into an enum value.
		 * 
		 * @param value
		 * @return
		 */
		public static Direction fromStringOrNull(String value) {

			try {
				return fromString(value);
			} catch (IllegalArgumentException e) {
				return null;
			}
		}
	}

	/**
	 * PropertyPath implements the pairing of an {@link Direction} and a
	 * property. It is used to provide input for {@link Sort}
	 * 
	 * @author Oliver Gierke
	 * @author Kevin Raymond
	 */
	public static class Order implements Serializable {

		private static final long serialVersionUID = 1522511010900108987L;
		private static final boolean DEFAULT_IGNORE_CASE = false;

		private final Direction direction;
		private final String property;
		private final boolean ignoreCase;

		/**
		 * Creates a new {@link Order} instance. if order is {@literal null}
		 * then order defaults to {@link Sort#DEFAULT_DIRECTION}
		 * 
		 * @param direction
		 *            can be {@literal null}, will default to
		 *            {@link Sort#DEFAULT_DIRECTION}
		 * @param property
		 *            must not be {@literal null} or empty.
		 */
		public Order(Direction direction, String property) {

			this(direction, property, DEFAULT_IGNORE_CASE);
		}

		/**
		 * Creates a new {@link Order} instance. Takes a single property.
		 * Direction defaults to {@link Sort#DEFAULT_DIRECTION}.
		 * 
		 * @param property
		 *            must not be {@literal null} or empty.
		 */
		public Order(String property) {
			this(DEFAULT_DIRECTION, property);
		}

		/**
		 * Creates a new {@link Order} instance. if order is {@literal null}
		 * then order defaults to {@link Sort#DEFAULT_DIRECTION}
		 * 
		 * @param direction
		 *            can be {@literal null}, will default to
		 *            {@link Sort#DEFAULT_DIRECTION}
		 * @param property
		 *            must not be {@literal null} or empty.
		 * @param ignoreCase
		 *            true if sorting should be case insensitive. false if
		 *            sorting should be case sensitive.
		 */
		private Order(Direction direction, String property, boolean ignoreCase) {

			if (!StringUtils.hasText(property)) {
				throw new IllegalArgumentException("Property must not null or empty!");
			}

			this.direction = direction == null ? DEFAULT_DIRECTION : direction;
			this.property = property;
			this.ignoreCase = ignoreCase;
		}

		/**
		 * @deprecated use {@link Sort#Sort(Direction, List)} instead.
		 */
		@Deprecated
		public static List<Order> create(Direction direction, Iterable<String> properties) {

			List<Order> orders = new ArrayList<Sort.Order>();
			for (String property : properties) {
				orders.add(new Order(direction, property));
			}
			return orders;
		}

		/**
		 * Returns the order the property shall be sorted for.
		 * 
		 * @return
		 */
		public Direction getDirection() {
			return direction;
		}

		/**
		 * Returns the property to order for.
		 * 
		 * @return
		 */
		public String getProperty() {
			return property;
		}

		/**
		 * Returns whether sorting for this property shall be ascending.
		 * 
		 * @return
		 */
		public boolean isAscending() {
			return this.direction.equals(Direction.ASC);
		}

		/**
		 * Returns whether or not the sort will be case sensitive.
		 * 
		 * @return
		 */
		public boolean isIgnoreCase() {
			return ignoreCase;
		}

		/**
		 * Returns a new {@link Order} with the given {@link Order}.
		 * 
		 * @param order
		 * @return
		 */
		public Order with(Direction order) {
			return new Order(order, this.property);
		}

		/**
		 * Returns a new {@link Sort} instance for the given properties.
		 * 
		 * @param properties
		 * @return
		 */
		public Sort withProperties(String... properties) {
			return new Sort(this.direction, properties);
		}

		/**
		 * Returns a new {@link Order} with case insensitive sorting enabled.
		 * 
		 * @return
		 */
		public Order ignoreCase() {
			return new Order(direction, property, true);
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#hashCode()
		 */
		@Override
		public int hashCode() {

			int result = 17;

			result = 31 * result + direction.hashCode();
			result = 31 * result + property.hashCode();

			return result;
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#equals(java.lang.Object)
		 */
		@Override
		public boolean equals(Object obj) {

			if (this == obj) {
				return true;
			}

			if (!(obj instanceof Order)) {
				return false;
			}

			Order that = (Order) obj;

			return this.direction.equals(that.direction) && this.property.equals(that.property);
		}

		/*
		 * (non-Javadoc)
		 * 
		 * @see java.lang.Object#toString()
		 */
		@Override
		public String toString() {
			return String.format("%s: %s", property, direction);
		}
	}
}
