# Pricing methodology

**Reference material — rarely changes.** Two frameworks, applied together: general usage-based
value-metric pricing, plus Apify's own platform-specific pay-per-event mechanics (relevant whenever
the project is an Apify Actor — check `../legal/` for any platform-specific constraints first).

### Value-metric pricing (general SaaS/usage-based)
Price on what creates customer value, not raw volume. Document where the product creates value for
the customer, then pick a metric that tracks that value directly — not just "items scraped." A
metric the customer can't predict or control undermines the model regardless of execution quality.
Source: [Best value metric for usage pricing: A 7-step framework](https://blog.alguna.com/value-metric-pricing/).

### Apify Pay-Per-Event (PPE) — official platform mechanics
Define specific, measurable chargeable events (e.g., "result produced," "API call made," "item
processed") — not a flat per-run fee. Two sub-strategies: fixed price per event, or usage-based price
per event (when the event itself has variable cost, e.g. an LLM call). Supports per-tier pricing
(Apify plan tiers) — typical pattern is Silver ~10% below Bronze, Gold ~20% below Bronze. Synthetic
events (`apify-actor-start`, `apify-default-dataset-item`) are predefined by Apify and billed
automatically alongside custom events. Source:
[Apify pay-per-event pricing model](https://docs.apify.com/actors/publishing/monetize/pay-per-event).

**Real precedent worth checking before locking any price**: pull 2-3 close comps on Apify Store
(`fetch-actor-details` with `pricing: true`) and see what they actually charge per event — raw-data
Actors tend to cluster near $0.002-0.006/result, analysis/report-layer Actors run higher ($0.02-0.10
per report-level event) and still get more usage than the cheaper raw ones. Framing beats price.
